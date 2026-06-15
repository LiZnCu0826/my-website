## 玩家群体类型枚举
## 定义游戏中四类核心玩家群体
class_name PlayerGroupType
extends Resource

## 氪金大佬 — 高付费，对白嫖友好内容容忍度低
const WHALE: String = "whale"
## 白嫖党 — 零付费，高活跃，发声意愿强
const F2P: String = "f2p"
## 休闲玩家 — 低付费，碎片化时间，怕复杂
const CASUAL: String = "casual"
## 硬核玩家 — 中付费，高投入，追求深度竞技
const HARDCORE: String = "hardcore"

## 获取所有群体列表
static func get_all() -> Array[String]:
	return [WHALE, F2P, CASUAL, HARDCORE]

## 获取群体显示名称
static func get_display_name(group: String) -> String:
	match group:
		WHALE:
			return "氪金大佬"
		F2P:
			return "白嫖党"
		CASUAL:
			return "休闲玩家"
		HARDCORE:
			return "硬核玩家"
		_:
			return "未知群体"

## 获取群体图标
static func get_icon(group: String) -> String:
	match group:
		WHALE:
			return "💰"
		F2P:
			return "🆓"
		CASUAL:
			return "☕"
		HARDCORE:
			return "⚔️"
		_:
			return "❓"
