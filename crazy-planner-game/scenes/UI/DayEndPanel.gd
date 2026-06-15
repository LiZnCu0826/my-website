## 每天结束的KPI评估面板
extends Control

signal next_day_requested

@onready var title_label: Label = $MarginContainer/OuterVBox/CenterWrapper/VBoxContainer/TitleLabel
@onready var result_label: Label = $MarginContainer/OuterVBox/CenterWrapper/VBoxContainer/ResultLabel
@onready var details_label: Label = $MarginContainer/OuterVBox/CenterWrapper/VBoxContainer/DetailsLabel
@onready var penalty_label: Label = $MarginContainer/OuterVBox/CenterWrapper/VBoxContainer/PenaltyLabel
@onready var next_button: Button = $MarginContainer/OuterVBox/NextButton

func _ready() -> void:
	next_button.pressed.connect(_on_next)
	hide()

func show_result(result: Dictionary) -> void:
	show()
	
	var stars: int = result.get("stars", 0)
	var star_str: String = ""
	for i in range(3):
		star_str += "⭐" if i < stars else "☆"
	
	if result["passed"]:
		title_label.text = "今日达成 %s" % star_str
		title_label.add_theme_color_override("font_color", Color(0.1, 0.65, 0.1))
		result_label.text = "老板表示满意"
	else:
		title_label.text = "今日仅 %s" % star_str
		title_label.add_theme_color_override("font_color", Color(0.8, 0.15, 0.15))
		result_label.text = "老板很不满！"
	
	var details: Array[String] = []
	details.append("📈 流水: %.0f / %.0fK %s" % [
		result["revenue_current"], result["revenue_target"],
		"⭐" if result["revenue_met"] else "✗"
	])
	details.append("📊 留存: %.0f / %.0f%% %s" % [
		result["retention_current"], result["retention_target"],
		"⭐" if result["retention_met"] else "✗"
	])
	details.append("💬 好评: %.0f / %.0f%% %s" % [
		result["rating_current"], result["rating_target"],
		"⭐" if result["rating_met"] else "✗"
	])
	
	var total_stars: int = KpiManager.passed_kpis
	details.append("")
	details.append("累计 ⭐ × %d / 21" % total_stars)
	details_label.text = "\n".join(details)
	
	if result["penalty"] > 0:
		penalty_label.text = "团队压力 +%d （累计 %d）" % [result["penalty"], KpiManager.total_penalty]
		penalty_label.show()
	else:
		penalty_label.text = "无额外压力"
		penalty_label.show()
	
	# 检查是否被辞退
	if KpiManager.is_fired():
		next_button.text = "我...被辞退了"
	else:
		next_button.text = "进入下一天 →"

func _on_next() -> void:
	hide()
	next_day_requested.emit()
