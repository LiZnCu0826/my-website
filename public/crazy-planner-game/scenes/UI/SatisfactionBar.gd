## 单个玩家群体满意度条
## 显示一个群体的名称、满意度数值和进度条
class_name SatisfactionBar
extends HBoxContainer

## 群体类型标识
var group_type: String = ""

@onready var icon_label: Label = $IconLabel
@onready var name_label: Label = $NameLabel
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var value_label: Label = $ValueLabel

## 初始化
func setup(group: String, initial_value: float) -> void:
	group_type = group
	icon_label.text = PlayerGroupType.get_icon(group)
	name_label.text = PlayerGroupType.get_display_name(group)
	update_value(initial_value)

## 更新满意度显示
func update_value(value: float) -> void:
	progress_bar.value = value
	value_label.text = "%d" % roundi(value)
	
	# 根据满意度改变颜色
	if value <= 20.0:
		progress_bar.modulate = Color(1.0, 0.2, 0.2)  # 红色 - 危险
	elif value <= 40.0:
		progress_bar.modulate = Color(1.0, 0.6, 0.2)  # 橙色 - 不满
	elif value >= 80.0:
		progress_bar.modulate = Color(0.2, 1.0, 0.2)  # 绿色 - 满意
	else:
		progress_bar.modulate = Color(1.0, 1.0, 1.0)  # 白色 - 正常
