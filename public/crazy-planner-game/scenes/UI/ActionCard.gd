## 运营动作卡牌（分级色彩版）
## 根据 tier 等级显示不同背景色：白→绿→蓝→金→红
class_name ActionCard
extends PanelContainer

signal card_selected(action_id: String)

var action_data: GameAction = null
var _disabled: bool = false

@onready var icon_label: Label = $MarginContainer/VBoxContainer/Header/IconLabel
@onready var name_label: Label = $MarginContainer/VBoxContainer/Header/NameLabel
@onready var time_label: Label = $MarginContainer/VBoxContainer/Header/TimeLabel
@onready var tier_label: Label = $MarginContainer/VBoxContainer/Header/TierLabel
@onready var desc_label: Label = $MarginContainer/VBoxContainer/DescLabel
@onready var effect_label: Label = $MarginContainer/VBoxContainer/EffectLabel
@onready var cooldown_overlay: ColorRect = $CooldownOverlay
@onready var cooldown_label: Label = $CooldownOverlay/CooldownLabel

func setup(action: GameAction) -> void:
	action_data = action
	icon_label.text = action.icon
	name_label.text = action.action_name
	time_label.text = "⏱ %d" % action.time_cost
	tier_label.text = GameAction.get_tier_name(action.tier)
	tier_label.modulate = GameAction.get_tier_color(action.tier)
	desc_label.text = action.description
	effect_label.text = action.get_effect_description()
	
	# 根据等级设置卡片背景色
	_set_tier_style(action.tier)
	
	_set_disabled(false)
	_cooldown_overlay(false)

func _set_tier_style(tier: int) -> void:
	var bg: Color = GameAction.get_tier_bg_color(tier)
	var border: Color = GameAction.get_tier_color(tier)
	
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
	style.content_margin_left = 10
	style.content_margin_top = 8
	style.content_margin_right = 10
	style.content_margin_bottom = 8
	
	add_theme_stylebox_override("panel", style)

func _set_disabled(val: bool) -> void:
	_disabled = val
	mouse_filter = MOUSE_FILTER_STOP if not val else MOUSE_FILTER_IGNORE
	modulate = Color(1, 1, 1, 0.4) if val else Color(1, 1, 1, 1)

func _cooldown_overlay(visible: bool, remaining: int = 0) -> void:
	cooldown_overlay.visible = visible
	if visible:
		cooldown_label.text = "冷却 %d回合" % remaining
		_set_disabled(true)

func update_cooldown(remaining: int) -> void:
	if remaining > 0:
		_cooldown_overlay(true, remaining)
	else:
		_cooldown_overlay(false)
		_set_disabled(false)

func _gui_input(event: InputEvent) -> void:
	if _disabled:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if action_data:
			card_selected.emit(action_data.action_id)
