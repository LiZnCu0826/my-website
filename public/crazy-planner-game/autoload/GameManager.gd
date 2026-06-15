## 游戏主循环管理器（Autoload 单例）
## 核心游戏循环：每天5个卡槽 → 填满 → 统一结算 → KPI评估
extends Node

## ===== 游戏状态常量 =====
enum GameState {
	MENU,        # 主菜单
	DAY_START,   # 一天开始，显示KPI简报（KPI数值隐藏）
	PLANNING,    # 玩家填5个卡槽，满意度/KPI不显示
	SETTLEMENT,  # 统一结算：依次执行5个动作，展示效果
	DAY_END,     # 一天结束，KPI评估
	GAME_OVER    # 游戏结束
}

## ===== 公开配置 =====
const SLOT_COUNT: int = 5

## ===== 状态 =====
var state: GameState = GameState.MENU: set = _set_state

## 当前天数（从第1天开始）
var current_day: int = 1

## 总天数
var total_days: int = KpiDatabase.get_total_days()

## 5个卡槽，每个存一个action_id，空字符串表示未填
var action_slots: Array[String] = []

## 当前要填的卡槽索引(0~4)
var current_slot_index: int = 0

## 各玩家群体的满意度
var satisfaction: Dictionary = {}
var satisfaction_decay: Dictionary = {}

## 动作冷却
var action_cooldowns: Dictionary = {}

## 今日随机卡池（8张卡片的action_id列表）
var daily_pool_ids: Array[String] = []

## 结算时的执行序号（用于动画展示）
var settlement_step: int = 0
var settlement_actions: Array[GameAction] = []
var _settlement_timer: float = 0.0

var is_new_game: bool = true
var _game_over_checked: bool = false

## 每日各等级权重表 [tier1, tier2, tier3, tier4, tier5]
const DAY_WEIGHTS: Dictionary = {
	1: [100,  0,   0,   0,   0],   # Day 1: 纯白色
	2: [70,  30,   0,   0,   0],   # Day 2: 白色+少量绿色
	3: [45,  30,  25,   0,   0],   # Day 3: 白+绿+少量蓝色
	4: [30,  25,  25,  20,   0],   # Day 4: 四种颜色
	5: [25,  20,  20,  20,  15],   # Day 5: 全色，红色初现
	6: [20,  20,  18,  22,  20],   # Day 6: 高阶占比上升
	7: [15,  15,  20,  25,  25],   # Day 7: 红金主导
}

func _ready() -> void:
	_init_satisfaction()

func _process(delta: float) -> void:
	if state == GameState.SETTLEMENT:
		_settlement_timer -= delta
		if _settlement_timer <= 0.0:
			_advance_settlement()

## 初始化满意度
func _init_satisfaction() -> void:
	for group: String in PlayerGroupType.get_all():
		satisfaction[group] = 50.0
		satisfaction_decay[group] = _get_default_decay(group)

static func _get_default_decay(group: String) -> float:
	match group:
		PlayerGroupType.WHALE:    return 3.0
		PlayerGroupType.F2P:      return 2.0
		PlayerGroupType.CASUAL:   return 1.5
		PlayerGroupType.HARDCORE: return 2.5
		_:                        return 2.0

## ===== 公共方法 =====

func start_new_game() -> void:
	is_new_game = false
	current_day = 1
	_init_satisfaction()
	action_cooldowns.clear()
	KpiManager.reset_all()
	_game_over_checked = false
	EventBus.game_started.emit()
	start_day()

## 开始新的一天
func start_day() -> void:
	action_slots = []
	for _i in range(SLOT_COUNT):
		action_slots.append("")
	current_slot_index = 0
	settlement_actions.clear()
	settlement_step = 0
	
	# 生成今日随机卡池
	_generate_daily_pool()
	
	KpiManager.setup_day_kpi(current_day)
	_apply_daily_decay()
	_reduce_cooldowns()
	
	_set_state(GameState.DAY_START)
	EventBus.day_changed.emit(current_day)

## 从DAY_START进入PLANNING（UI确认KPI简报后调用）
func start_planning() -> void:
	_set_state(GameState.PLANNING)

## 填充当前卡槽
func assign_slot(action_id: String) -> bool:
	if state != GameState.PLANNING:
		push_warning("GameManager: 不能在非PLANNING状态下填卡槽")
		return false
	
	if current_slot_index >= SLOT_COUNT:
		push_warning("GameManager: 卡槽已满")
		return false
	
	# 检查冷却
	if action_cooldowns.get(action_id, 0) > 0:
		push_warning("GameManager: 动作 %s 尚在冷却中" % action_id)
		return false
	
	# 检查是否已经在某个卡槽中
	for i in range(SLOT_COUNT):
		if action_slots[i] == action_id:
			push_warning("GameManager: 动作 %s 已在卡槽 %d" % [action_id, i])
			return false
	
	action_slots[current_slot_index] = action_id
	EventBus.slot_filled.emit(current_slot_index, action_id)
	current_slot_index += 1
	
	# 检查是否全部填满
	if current_slot_index >= SLOT_COUNT:
		EventBus.all_slots_filled.emit()
	
	return true

## 移除某个卡槽的动作（允许反悔）
func remove_slot(index: int) -> bool:
	if state != GameState.PLANNING:
		return false
	if index < 0 or index >= SLOT_COUNT:
		return false
	if action_slots[index] == "":
		return false
	
	action_slots[index] = ""
	# 调整current_slot_index
	if index < current_slot_index:
		current_slot_index = index
	EventBus.slot_removed.emit(index)
	
	return true

## 判断是否全部填满
func is_all_slots_filled() -> bool:
	return current_slot_index >= SLOT_COUNT

## 获取已填卡槽的动作ID列表（跳过空槽）
func get_filled_slot_ids() -> Array[String]:
	var result: Array[String] = []
	for i in range(SLOT_COUNT):
		if action_slots[i] != "":
			result.append(action_slots[i])
	return result

## 开始统一结算
func start_settlement() -> void:
	if state != GameState.PLANNING:
		return
	if not is_all_slots_filled():
		return
	
	_set_state(GameState.SETTLEMENT)
	settlement_step = -1
	
	# 收集所有要执行的动作
	settlement_actions.clear()
	for action_id: String in action_slots:
		var action: GameAction = ActionDatabase.get_action_by_id(action_id)
		if action:
			settlement_actions.append(action)
	
	EventBus.settlement_started.emit()
	# 立刻开始第一个动作
	_advance_settlement()

## 结算中的每一步
func _advance_settlement() -> void:
	settlement_step += 1
	
	if settlement_step >= settlement_actions.size():
		# 结算完毕
		_finish_settlement()
		return
	
	var action: GameAction = settlement_actions[settlement_step]
	
	# 应用满意度影响
	_apply_satisfaction_effects(action)
	
	# 触发冷却
	if action.cooldown > 0:
		action_cooldowns[action.action_id] = action.cooldown
	
	EventBus.action_executed.emit(action.action_id)
	EventBus.settlement_step.emit(settlement_step, action.action_id)
	
	# 每步间隔0.6秒，让UI展示效果
	_settlement_timer = 0.6

## 结算完成 → 进入日终评估
func _finish_settlement() -> void:
	EventBus.settlement_completed.emit()
	_set_state(GameState.DAY_END)
	
	var result: Dictionary = KpiManager.evaluate_day()
	
	if KpiManager.is_fired():
		_game_over(false)
		return
	
	current_day += 1
	if current_day > total_days:
		_game_over(KpiManager.is_game_successful())

## 生成今日随机卡池（按概率权重抽取8张，允许重复）
func _generate_daily_pool() -> void:
	daily_pool_ids.clear()
	
	# 获取当天权重
	var weights = DAY_WEIGHTS.get(clamp(current_day, 1, 7), [25, 20, 20, 20, 15])
	var total_weight: int = 0
	for w in weights:
		total_weight += w
	
	# 按 tier 分组
	var tier_cards = [[], [], [], [], []]
	for action: GameAction in ActionDatabase.get_all_actions():
		var t: int = clamp(action.tier, 1, 5)
		tier_cards[t - 1].append(action.action_id)
	
	# 抽取 10 张（同一天不重复抽取同一张卡）
	var picked_set: Dictionary = {}
	for _i in range(10):
		# 如果所有卡片已抽完则停止
		if picked_set.size() >= _get_total_card_count(tier_cards):
			break
		
		var roll: int = randi() % total_weight
		var cumulative: int = 0
		var chosen_tier: int = 0
		for t in range(5):
			cumulative += weights[t]
			if roll < cumulative:
				chosen_tier = t
				break
		
		# 从该等级随机选一张未选过的
		var pool: Array = tier_cards[chosen_tier]
		var card: String = _pick_unused_from_pool(pool, picked_set, tier_cards)
		if card != "":
			picked_set[card] = true
			daily_pool_ids.append(card)

# 计算所有层级卡片总数
func _get_total_card_count(tier_cards: Array) -> int:
	var total: int = 0
	for pool in tier_cards:
		total += (pool as Array).size()
	return total

# 从指定池中选一张未使用过的，如果池空则扩散搜索
func _pick_unused_from_pool(pool: Array, used: Dictionary, tier_cards: Array) -> String:
	# 先在本层级找
	var candidates: Array = []
	for card_id in pool:
		if not used.has(card_id):
			candidates.append(card_id)
	if not candidates.is_empty():
		return candidates[randi() % candidates.size()]
	
	# 降级搜索
	for fallback in range(5):
		for card_id in tier_cards[fallback]:
			if not used.has(card_id):
				return card_id
	return ""

## 获取今日卡池中可用的动作（排除冷却中的、已在卡槽中的）
func get_available_actions() -> Array[GameAction]:
	var available: Array[GameAction] = []
	var used_ids: Array[String] = []
	for i in range(SLOT_COUNT):
		if action_slots[i] != "":
			used_ids.append(action_slots[i])
	
	for action_id: String in daily_pool_ids:
		if action_cooldowns.get(action_id, 0) > 0:
			continue
		if used_ids.has(action_id):
			continue
		var action: GameAction = ActionDatabase.get_action_by_id(action_id)
		if action:
			available.append(action)
	return available

func get_cooldown(action_id: String) -> int:
	return action_cooldowns.get(action_id, 0)

## 进入下一天
func proceed_to_next_day() -> void:
	if current_day <= total_days:
		start_day()

## ===== 内部方法 =====

func _set_state(new_state: GameState) -> void:
	state = new_state

func _apply_daily_decay() -> void:
	for group: String in PlayerGroupType.get_all():
		var decay: float = satisfaction_decay.get(group, 2.0)
		var old_value: float = satisfaction.get(group, 50.0)
		var new_value: float = clampf(old_value - decay, 0.0, 100.0)
		satisfaction[group] = new_value
		EventBus.satisfaction_changed.emit(group, old_value, new_value)

func _apply_satisfaction_effects(action: GameAction) -> void:
	for group: String in action.satisfaction_effects:
		var delta: float = action.satisfaction_effects[group]
		var old_value: float = satisfaction.get(group, 50.0)
		var new_value: float = clampf(old_value + delta, 0.0, 100.0)
		satisfaction[group] = new_value
		EventBus.satisfaction_changed.emit(group, old_value, new_value)
		
		if new_value <= 20.0 and old_value > 20.0:
			EventBus.satisfaction_danger.emit(group, new_value)
		elif new_value >= 80.0 and old_value < 80.0:
			EventBus.satisfaction_excellent.emit(group, new_value)

func _reduce_cooldowns() -> void:
	var to_remove: Array[String] = []
	for action_id: String in action_cooldowns:
		var cd: int = action_cooldowns[action_id] - 1
		if cd <= 0:
			to_remove.append(action_id)
		else:
			action_cooldowns[action_id] = cd
	for action_id: String in to_remove:
		action_cooldowns.erase(action_id)
	EventBus.cooldown_updated.emit()

func _game_over(success: bool) -> void:
	if _game_over_checked:
		return
	_game_over_checked = true
	_set_state(GameState.GAME_OVER)
	EventBus.game_ended.emit(success)
