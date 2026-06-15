## 每天开始的KPI简报面板
extends Control

signal confirmed

@onready var day_label: Label = $MarginContainer/CenterWrapper/VBoxContainer/DayLabel
@onready var kpi_name_label: Label = $MarginContainer/CenterWrapper/VBoxContainer/KpiNameLabel
@onready var desc_label: Label = $MarginContainer/CenterWrapper/VBoxContainer/DescLabel
@onready var kpi_summary: VBoxContainer = $MarginContainer/CenterWrapper/VBoxContainer/KpiSummary
@onready var confirm_button: Button = $MarginContainer/CenterWrapper/VBoxContainer/ConfirmButton

func _ready() -> void:
	confirm_button.pressed.connect(_on_confirm)
	hide()

func show_day(day: int) -> void:
	var kpi: KpiDefinition = KpiDatabase.get_kpi_by_day(day)
	if kpi == null:
		return
	
	day_label.text = "——  第 %d 天  ——" % day
	kpi_name_label.text = kpi.kpi_name
	desc_label.text = kpi.description
	
	# 清空旧的摘要
	for child in kpi_summary.get_children():
		child.queue_free()
	
	var revenue_line := Label.new()
	revenue_line.text = "📈 流水目标: %dK" % kpi.revenue_target
	revenue_line.add_theme_color_override("font_color", Color(0.2, 0.2, 0.25, 1))
	kpi_summary.add_child(revenue_line)
	
	var retention_line := Label.new()
	retention_line.text = "📊 留存目标: %d%%" % kpi.retention_target
	retention_line.add_theme_color_override("font_color", Color(0.2, 0.2, 0.25, 1))
	kpi_summary.add_child(retention_line)
	
	var rating_line := Label.new()
	rating_line.text = "⭐ 好评目标: %d%%" % kpi.rating_target
	rating_line.add_theme_color_override("font_color", Color(0.2, 0.2, 0.25, 1))
	kpi_summary.add_child(rating_line)
	
	show()

func _on_confirm() -> void:
	hide()
	confirmed.emit()
