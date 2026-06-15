## 运营动作 Resource
## 定义玩家可以执行的一个运营操作（对应原版游戏中的一道菜）
class_name GameAction
extends Resource

## ===== 基础属性 =====
## 动作唯一标识
@export var action_id: String = ""

## 动作名称
@export var action_name: String = ""

## 动作描述
@export var description: String = ""

## 动作图标（emoji 占位符）
@export var icon: String = "📋"

## ===== 分级系统 =====
## 卡牌等级 1~5（1=白色，2=绿色，3=蓝色，4=金色，5=红色）
@export var tier: int = 1

## 解锁天数（第X天起可用，Day1 → unlock_day=1）
@export var unlock_day: int = 1

## ===== 游戏数据 =====
## 执行该操作消耗的"时间单位"
@export var time_cost: int = 1

## 冷却回合数
@export var cooldown: int = 0

## 对各玩家群体满意度的影响
## key: PlayerGroupType, value: 满意度变化值(-100 ~ 100)
@export var satisfaction_effects: Dictionary = {}

## 对KPI的影响
## key: 影响类型(revenue/retention/rating), value: 变化值
@export var kpi_effects: Dictionary = {}

## 动作类型分类
@export var category: String = ""

## ===== 等级颜色 =====
static func get_tier_name(t: int) -> String:
	match t:
		1: return "基础"
		2: return "优秀"
		3: return "稀有"
		4: return "史诗"
		5: return "传说"
		_: return "未知"

static func get_tier_color(t: int) -> Color:
	match t:
		1: return Color(0.85, 0.85, 0.9)   # 白色
		2: return Color(0.3, 0.85, 0.4)    # 绿色
		3: return Color(0.3, 0.55, 1.0)    # 蓝色
		4: return Color(1.0, 0.75, 0.2)    # 金色
		5: return Color(1.0, 0.25, 0.2)    # 红色
		_: return Color(0.5, 0.5, 0.5)

static func get_tier_bg_color(t: int) -> Color:
	match t:
		1: return Color(0.18, 0.18, 0.22)  # 灰底
		2: return Color(0.12, 0.25, 0.14)  # 暗绿
		3: return Color(0.10, 0.18, 0.30)  # 暗蓝
		4: return Color(0.28, 0.22, 0.08)  # 暗金
		5: return Color(0.28, 0.08, 0.08)  # 暗红
		_: return Color(0.15, 0.15, 0.18)

## 获取影响的描述文本
func get_effect_description() -> String:
	var lines: Array[String] = []
	for group: String in satisfaction_effects:
		var delta: float = satisfaction_effects[group]
		var display_name: String = PlayerGroupType.get_display_name(group)
		var sign: String = "+" if delta >= 0 else ""
		lines.append("%s %s%.0f" % [display_name, sign, delta])
	
	for kpi_type: String in kpi_effects:
		var delta: float = kpi_effects[kpi_type]
		var sign: String = "+" if delta >= 0 else ""
		var kpi_name: String = _get_kpi_display(kpi_type)
		lines.append("%s %s%.0f" % [kpi_name, sign, delta])
	
	return "\n".join(lines)

static func _get_kpi_display(kpi_type: String) -> String:
	match kpi_type:
		"revenue":
			return "📈流水"
		"retention":
			return "📊留存"
		"rating":
			return "⭐好评"
		_:
			return kpi_type
