## 主游戏场景逻辑（卡槽版）
## 5个卡槽 → 填满 → 统一结算 → KPI评估
extends Control

# ===== 节点引用 =====
@onready var satisfaction_bars_container: VBoxContainer = $CanvasLayer/SatisfactionPanel/VBoxContainer/SatisfactionBars
@onready var action_container: VBoxContainer = $CanvasLayer/ActionPanel/VBoxContainer/ScrollContainer/ActionContainer
@onready var kpi_bars_container: VBoxContainer = $CanvasLayer/KpiPanel/VBoxContainer/KpiBars
@onready var day_label: Label = $CanvasLayer/TopBar/DayLabel
@onready var time_label: Label = $CanvasLayer/TopBar/TimeLabel
@onready var penalty_bar: ProgressBar = $CanvasLayer/TopBar/PenaltyBar
@onready var penalty_label: Label = $CanvasLayer/TopBar/PenaltyLabel
@onready var game_title_label: Label = $CanvasLayer/GameTitle
@onready var start_button: Button = $CanvasLayer/StartButton
@onready var day_start_panel: Control = $CanvasLayer/Overlay/DayStartPanel
@onready var day_end_panel: Control = $CanvasLayer/Overlay/DayEndPanel
@onready var game_over_panel: Control = $CanvasLayer/Overlay/GameOverPanel
@onready var satisfaction_panel_container: MarginContainer = $CanvasLayer/SatisfactionPanel
@onready var action_panel_container: MarginContainer = $CanvasLayer/ActionPanel
@onready var top_bar: HBoxContainer = $CanvasLayer/TopBar
@onready var overlay: Panel = $CanvasLayer/Overlay

# 5个卡槽节点
@onready var slot_panels: Array[PanelContainer] = [
	$CanvasLayer/SlotPanel/VBox/SlotGrid/Slot1,
	$CanvasLayer/SlotPanel/VBox/SlotGrid/Slot2,
	$CanvasLayer/SlotPanel/VBox/SlotGrid/Slot3,
	$CanvasLayer/SlotPanel/VBox/SlotGrid/Slot4,
	$CanvasLayer/SlotPanel/VBox/SlotGrid/Slot5,
]

# 结算按钮
@onready var settle_button: Button = $CanvasLayer/SlotPanel/VBox/SettleButton

# 卡槽内的子节点（Label + 图标）
var _slot_labels: Array[Label] = []
var _slot_icons: Array[Label] = []

var _satisfaction_bars: Dictionary = {}
var _settlement_step_label: Label

func _ready() -> void:
	# 订阅信号
	EventBus.day_changed.connect(_on_day_changed)
	EventBus.time_changed.connect(_on_time_changed)
	EventBus.satisfaction_changed.connect(_on_satisfaction_changed)
	EventBus.kpi_updated.connect(_on_kpi_updated)
	EventBus.kpi_evaluated.connect(_on_kpi_evaluated)
	EventBus.game_ended.connect(_on_game_ended)
	EventBus.slot_filled.connect(_on_slot_filled)
	EventBus.slot_removed.connect(_on_slot_removed)
	EventBus.all_slots_filled.connect(_on_all_slots_filled)
	EventBus.settlement_started.connect(_on_settlement_started)
	EventBus.settlement_step.connect(_on_settlement_step)
	EventBus.settlement_completed.connect(_on_settlement_completed)
	
	# 面板信号
	day_start_panel.confirmed.connect(_on_day_start_confirmed)
	day_end_panel.next_day_requested.connect(_on_next_day)
	game_over_panel.restart_requested.connect(_on_restart)
	settle_button.pressed.connect(_on_settle_pressed)
	
	# 初始化卡槽Label引用
	for i in range(5):
		var slot: PanelContainer = slot_panels[i]
		_slot_labels.append(slot.get_node("CardHBox/Label") as Label)
		_slot_icons.append(slot.get_node("CardHBox/Icon") as Label)
		slot.gui_input.connect(_on_slot_gui_input.bind(i))
	
	# 初始化满意度面板
	_setup_satisfaction_panel()
	
	start_button.pressed.connect(_on_start_game)
	show_menu()

# ===== UI 布局控制 =====

func show_menu() -> void:
	game_title_label.show()
	$CanvasLayer/GameTitleSub.show()
	start_button.show()
	satisfaction_panel_container.hide()
	action_panel_container.hide()
	$CanvasLayer/SlotPanel.hide()
	top_bar.hide()
	overlay.hide()
	day_start_panel.hide()
	day_end_panel.hide()
	game_over_panel.hide()

func start_game_ui() -> void:
	game_title_label.hide()
	$CanvasLayer/GameTitleSub.hide()
	start_button.hide()
	satisfaction_panel_container.hide()
	action_panel_container.show()
	$CanvasLayer/SlotPanel.show()
	top_bar.show()
	overlay.show()

# ===== 初始化 =====

func _setup_satisfaction_panel() -> void:
	_satisfaction_bars.clear()
	for child in satisfaction_bars_container.get_children():
		child.queue_free()
	
	for group: String in PlayerGroupType.get_all():
		var bar_scene := preload("res://scenes/UI/SatisfactionBar.tscn")
		var bar := bar_scene.instantiate() as SatisfactionBar
		satisfaction_bars_container.add_child(bar)
		bar.setup(group, 50.0)
		_satisfaction_bars[group] = bar

# ===== 卡槽管理 =====

func _clear_slots() -> void:
	for i in range(5):
		_slot_labels[i].text = ""
		_slot_icons[i].text = "⬜"
		slot_panels[i].modulate = Color(1, 1, 1, 0.4)
		slot_panels[i].remove_theme_stylebox_override("panel")

func _update_slot(index: int, action_id: String) -> void:
	if action_id == "":
		_slot_labels[index].text = ""
		_slot_icons[index].text = "⬜"
		slot_panels[index].modulate = Color(1, 1, 1, 0.4)
		slot_panels[index].remove_theme_stylebox_override("panel")
	else:
		var action: GameAction = ActionDatabase.get_action_by_id(action_id)
		if action:
			_slot_labels[index].text = action.action_name
			_slot_icons[index].text = action.icon
			slot_panels[index].modulate = Color(1, 1, 1, 1)
			# 同步卡槽背景色与卡片等级一致
			var bg: Color = GameAction.get_tier_bg_color(action.tier)
			var border: Color = GameAction.get_tier_color(action.tier)
			var style := StyleBoxFlat.new()
			style.bg_color = bg
			style.border_color = border
			style.border_width_left = 2
			style.border_width_top = 2
			style.border_width_right = 2
			style.border_width_bottom = 2
			style.corner_radius_top_left = 6
			style.corner_radius_top_right = 6
			style.corner_radius_bottom_right = 6
			style.corner_radius_bottom_left = 6
			slot_panels[index].add_theme_stylebox_override("panel", style)

# ===== 动作卡牌管理 =====

func _build_action_cards() -> void:
	for child in action_container.get_children():
		child.queue_free()
	
	var actions: Array[GameAction] = GameManager.get_available_actions()
	for action: GameAction in actions:
		var card_scene := preload("res://scenes/UI/ActionCard.tscn")
		var card := card_scene.instantiate() as ActionCard
		action_container.add_child(card)
		card.setup(action)
		
		var cd: int = GameManager.get_cooldown(action.action_id)
		if cd > 0:
			card.update_cooldown(cd)
		
		card.card_selected.connect(_on_card_selected.bind(card))

# ===== KPI 面板更新 =====

func _update_kpi_panel() -> void:
	var kpi: KpiDefinition = KpiManager.current_kpi
	if kpi == null:
		return
	
	for child in kpi_bars_container.get_children():
		child.queue_free()
	
	var kpi_data: Array[Dictionary] = [
		{"type": "revenue", "name": "📈 流水", "current": kpi.current_revenue, "target": kpi.revenue_target},
		{"type": "retention", "name": "📊 留存", "current": kpi.current_retention, "target": kpi.retention_target},
		{"type": "rating", "name": "⭐ 好评", "current": kpi.current_rating, "target": kpi.rating_target}
	]
	
	for data in kpi_data:
		var bar_scene := preload("res://scenes/UI/KpiBar.tscn")
		var bar := bar_scene.instantiate() as KpiBar
		kpi_bars_container.add_child(bar)
		bar.setup(data["type"], data["name"], data["current"], data["target"])

# ===== 信号处理 =====

func _on_start_game() -> void:
	start_game_ui()
	GameManager.start_new_game()

func _on_day_changed(day: int) -> void:
	day_label.text = "第 %d 天" % day
	_update_kpi_panel()
	_clear_slots()
	_build_action_cards()
	# 重新显示卡槽和可用动作，隐藏满意度/KPI
	$CanvasLayer/SlotPanel.show()
	action_panel_container.show()
	satisfaction_panel_container.hide()
	$CanvasLayer/KpiPanel.hide()
	settle_button.disabled = true
	overlay.show()
	day_start_panel.show_day(day)

func _on_day_start_confirmed() -> void:
	overlay.hide()
	GameManager.start_planning()

func _on_time_changed(current: int, max_time: int) -> void:
	time_label.text = "剩余操作: %d/%d" % [current, max_time]
	penalty_bar.value = KpiManager.total_penalty
	penalty_label.text = "压力: %d/100" % KpiManager.total_penalty

func _on_satisfaction_changed(group: String, old_value: float, new_value: float) -> void:
	var bar: SatisfactionBar = _satisfaction_bars.get(group)
	if bar:
		bar.update_value(new_value)

func _on_kpi_updated() -> void:
	_update_kpi_panel()

# ===== 卡槽选择 =====

func _on_card_selected(action_id: String, card: ActionCard) -> void:
	var success: bool = GameManager.assign_slot(action_id)
	if success:
		# 从可用列表中移除该卡牌
		if card.get_parent() == action_container:
			action_container.remove_child(card)
			card.queue_free()
	else:
		EventBus.notification.emit("该操作不可用", "error")

func _on_slot_filled(index: int, action_id: String) -> void:
	_update_slot(index, action_id)

func _on_slot_removed(index: int) -> void:
	_update_slot(index, "")
	settle_button.disabled = true

func _on_all_slots_filled() -> void:
	settle_button.disabled = false

func _on_slot_gui_input(event: InputEvent, index: int) -> void:
	if not (event is InputEventMouseButton and event.pressed):
		return
	# 左键点击已选卡槽，把卡片拿下来放回可用列表
	if event.button_index == MOUSE_BUTTON_LEFT:
		var action_id: String = GameManager.action_slots[index]
		if action_id != "":
			GameManager.remove_slot(index)
			_build_action_cards()

# ===== 结算 =====

func _on_settle_pressed() -> void:
	settle_button.disabled = true
	# 隐藏卡槽和可用动作区，显示满意度面板
	$CanvasLayer/SlotPanel.hide()
	action_panel_container.hide()
	satisfaction_panel_container.show()
	$CanvasLayer/KpiPanel.show()
	GameManager.start_settlement()

func _on_settlement_started() -> void:
	# 可以加一个结算动画的占位
	pass

func _on_settlement_step(step: int, action_id: String) -> void:
	var action: GameAction = ActionDatabase.get_action_by_id(action_id)
	if action:
		EventBus.notification.emit("执行: %s" % action.action_name, "info")

func _on_settlement_completed() -> void:
	# 更新最终KPI/KPI面板
	_update_kpi_panel()

func _on_kpi_evaluated(kpi_id: String, passed: bool) -> void:
	overlay.show()
	if KpiManager.kpi_history.is_empty():
		return
	var result: Dictionary = KpiManager.kpi_history.back()
	day_end_panel.show_result(result)

func _on_next_day() -> void:
	# proceed_to_next_day 会触发 _on_day_changed 处理UI
	GameManager.proceed_to_next_day()

func _on_game_ended(success: bool) -> void:
	satisfaction_panel_container.hide()
	action_panel_container.hide()
	$CanvasLayer/SlotPanel.hide()
	top_bar.hide()
	day_start_panel.hide()
	day_end_panel.hide()
	overlay.show()
	game_over_panel.show_result(success)

func _on_restart() -> void:
	game_over_panel.hide()
	show_menu()
