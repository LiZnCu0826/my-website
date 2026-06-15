## KPI 管理器（Autoload 单例）
## 管理每日KPI任务、进度追踪、评估
extends Node

## 当前KPI任务
var current_kpi: KpiDefinition = null

## 累计惩罚分数（超过阈值即被辞退）
var total_penalty: int = 0

## 最大可承受惩罚
const MAX_PENALTY: int = 100

## 已通过的KPI数量
var passed_kpis: int = 0

## KPI历史记录
var kpi_history: Array[Dictionary] = []

func _ready() -> void:
	EventBus.action_executed.connect(_on_action_executed)

## 初始化当天KPI
func setup_day_kpi(day: int) -> void:
	current_kpi = KpiDatabase.get_kpi_by_day(day)
	if current_kpi:
		current_kpi.reset_progress()
		EventBus.kpi_updated.emit()
	else:
		push_warning("KpiManager: 未找到第 %d 天的KPI" % day)

## 当天结束时的KPI评估
func evaluate_day() -> Dictionary:
	if current_kpi == null:
		return {"passed": true, "penalty": 0}
	
	# 逐项判断三个KPI是否达标，每达标一项得一颗星
	var star_count: int = 0
	star_count += 1 if current_kpi.current_revenue >= current_kpi.revenue_target else 0
	star_count += 1 if current_kpi.current_retention >= current_kpi.retention_target else 0
	star_count += 1 if current_kpi.current_rating >= current_kpi.rating_target else 0
	
	passed_kpis += star_count
	
	# 当天整体通过 = 至少拿到 2 颗星
	var day_passed: bool = star_count >= 2
	var penalty: int = 0
	if not day_passed:
		penalty = current_kpi.penalty_score
		total_penalty += penalty
	
	var result := {
		"kpi_id": current_kpi.kpi_id,
		"passed": day_passed,
		"penalty": penalty,
		"stars": star_count,
		"revenue_met": current_kpi.current_revenue >= current_kpi.revenue_target,
		"retention_met": current_kpi.current_retention >= current_kpi.retention_target,
		"rating_met": current_kpi.current_rating >= current_kpi.rating_target,
		"revenue_current": current_kpi.current_revenue,
		"revenue_target": current_kpi.revenue_target,
		"retention_current": current_kpi.current_retention,
		"retention_target": current_kpi.retention_target,
		"rating_current": current_kpi.current_rating,
		"rating_target": current_kpi.rating_target
	}
	
	kpi_history.append(result)
	EventBus.kpi_evaluated.emit(current_kpi.kpi_id, day_passed)
	
	return result

## 玩家是否被辞退（累计惩罚过高）
func is_fired() -> bool:
	return total_penalty >= MAX_PENALTY

## 在所有天数结束后，判断是否成功
func is_game_successful() -> bool:
	return passed_kpis >= 7

## 根据总星数获取策划称号
static func get_rank_name(stars: int) -> String:
	if stars >= 18:
		return "天才策划"
	elif stars >= 14:
		return "正式策划"
	elif stars >= 7:
		return "实习策划"
	else:
		return "试用期未过"

## 当动作执行后，更新KPI进度
func _on_action_executed(action_id: String) -> void:
	if current_kpi == null:
		return
	
	var action: GameAction = ActionDatabase.get_action_by_id(action_id)
	if action == null:
		return
	
	# 应用KPI影响
	for kpi_type: String in action.kpi_effects:
		var delta: float = action.kpi_effects[kpi_type]
		match kpi_type:
			"revenue":
				current_kpi.current_revenue = maxf(0.0, current_kpi.current_revenue + delta)
			"retention":
				current_kpi.current_retention = clampf(current_kpi.current_retention + delta, 0.0, 100.0)
			"rating":
				current_kpi.current_rating = clampf(current_kpi.current_rating + delta, 0.0, 100.0)
	
	# 发射进度信号
	EventBus.kpi_progress_changed.emit(
		current_kpi.kpi_id,
		"revenue",
		current_kpi.current_revenue,
		current_kpi.revenue_target
	)
	EventBus.kpi_progress_changed.emit(
		current_kpi.kpi_id,
		"retention",
		current_kpi.current_retention,
		current_kpi.retention_target
	)
	EventBus.kpi_progress_changed.emit(
		current_kpi.kpi_id,
		"rating",
		current_kpi.current_rating,
		current_kpi.rating_target
	)
	EventBus.kpi_updated.emit()

## 重置所有状态（新游戏用）
func reset_all() -> void:
	current_kpi = null
	total_penalty = 0
	passed_kpis = 0
	kpi_history.clear()
