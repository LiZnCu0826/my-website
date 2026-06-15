## KPI 任务定义 Resource
## 定义每一天结束时公司考核的 KPI 目标（对应原版游戏中的订单）
class_name KpiDefinition
extends Resource

## KPI 唯一标识
@export var kpi_id: String = ""

## KPI 名称
@export var kpi_name: String = ""

## KPI 描述
@export var description: String = ""

## 第几天出现(从第1天开始)
@export var day: int = 1

## 流水目标（¥K）
@export var revenue_target: float = 0.0

## 留存率目标（百分比）
@export var retention_target: float = 0.0

## 好评率目标（百分比）
@export var rating_target: float = 0.0

## 失败惩罚描述
@export var penalty_description: String = ""

## 失败时扣除的分数
@export var penalty_score: int = 0

## 玩家当前对各目标的完成情况
var current_revenue: float = 0.0
var current_retention: float = 0.0
var current_rating: float = 0.0

## 重置当前进度
func reset_progress() -> void:
	current_revenue = 0.0
	current_retention = 0.0
	current_rating = 0.0

## 是否全部达标
func is_all_met() -> bool:
	return current_revenue >= revenue_target \
		and current_retention >= retention_target \
		and current_rating >= rating_target

## 获取每个KPI的完成情况文本
func get_progress_summary() -> Array[String]:
	var lines: Array[String] = []
	lines.append("📈流水: %.0f/%.0fK" % [current_revenue, revenue_target])
	lines.append("📊留存: %.0f/%.0f%%" % [current_retention, retention_target])
	lines.append("⭐好评: %.0f/%.0f%%" % [current_rating, rating_target])
	return lines

## 获取达成率（用于进度条）
func get_overall_progress() -> float:
	var total_target: float = revenue_target + retention_target + rating_target
	if total_target <= 0:
		return 1.0
	var total_current: float = minf(current_revenue, revenue_target) \
		+ minf(current_retention, retention_target) \
		+ minf(current_rating, rating_target)
	return total_current / total_target

## 获取单个KPI的进度比例
func get_kpi_progress(kpi_type: String) -> float:
	match kpi_type:
		"revenue":
			return current_revenue / maxf(revenue_target, 0.001)
		"retention":
			return current_retention / maxf(retention_target, 0.001)
		"rating":
			return current_rating / maxf(rating_target, 0.001)
		_:
			return 0.0
