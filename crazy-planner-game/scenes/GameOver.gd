## 游戏结束场景
extends Control

signal restart_requested

@onready var title_label: Label = $MarginContainer/CenterWrapper/VBoxContainer/TitleLabel
@onready var subtitle_label: Label = $MarginContainer/CenterWrapper/VBoxContainer/SubtitleLabel
@onready var stats_label: Label = $MarginContainer/CenterWrapper/VBoxContainer/StatsLabel
@onready var comment_label: Label = $MarginContainer/CenterWrapper/VBoxContainer/CommentLabel
@onready var restart_button: Button = $MarginContainer/CenterWrapper/VBoxContainer/RestartButton

func _ready() -> void:
	restart_button.pressed.connect(_on_restart)

func show_result(success: bool) -> void:
	show()
	
	var stars: int = KpiManager.passed_kpis
	var rank: String = KpiManager.get_rank_name(stars)
	var penalty: int = KpiManager.total_penalty
	
	# 星标展示
	var star_bar: String = ""
	for i in range(21):
		star_bar += "⭐" if i < stars else "☆"
		if (i + 1) % 7 == 0 and i < 20:
			star_bar += "\n"
	
	if success:
		title_label.text = "🎉 恭喜通关！"
		title_label.add_theme_color_override("font_color", Color(0.1, 0.65, 0.1))
		subtitle_label.text = "最终评定：%s" % rank
	else:
		title_label.text = "💀 你被辞退了"
		title_label.add_theme_color_override("font_color", Color(0.8, 0.15, 0.15))
		subtitle_label.text = "最终评定：%s" % rank
	
	stats_label.text = "⭐ %d / 21 颗星\n团队压力: %d/100" % [stars, penalty]
	
	# 根据星级给出评语
	var comment: String = ""
	match rank:
		"天才策划":
			comment = "完美运营！你是游戏圈的天才策划！21颗星闪闪发光，玩家泪目！"
		"正式策划":
			comment = "优秀！你在各方利益间找到了不错的平衡点。虽然有些玩家不高兴，但项目活下来了。"
		"实习策划":
			comment = "勉强及格。你经历了艰难的取舍，有些群体被你牺牲了……但这就是现实。"
		_:
			comment = "不太理想。你在KPI和玩家满意度之间挣扎，下次要更果断地取舍。"
	comment_label.text = comment

func _on_restart() -> void:
	hide()
	restart_requested.emit()
