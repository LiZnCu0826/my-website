## 单项KPI进度条
## 显示一个KPI指标的当前进度vs目标
class_name KpiBar
extends HBoxContainer

var kpi_type: String = ""

@onready var name_label: Label = $NameLabel
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var value_label: Label = $ValueLabel

func setup(type: String, display_name: String, current: float, target: float) -> void:
	kpi_type = type
	name_label.text = display_name
	update_progress(current, target)

func update_progress(current: float, target: float) -> void:
	var ratio: float = current / maxf(target, 0.001)
	progress_bar.value = minf(ratio, 1.0) * 100.0
	value_label.text = "%.0f / %.0f" % [current, target]
	
	# 达标绿色，未达标红色
	if current >= target:
		progress_bar.modulate = Color(0.2, 1.0, 0.2)
	else:
		progress_bar.modulate = Color(1.0, 0.4, 0.4)
