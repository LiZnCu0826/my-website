## 运营动作数据库
## 5个等级，23张卡牌，按天解锁
class_name ActionDatabase
extends Resource

static func get_all_actions() -> Array[GameAction]:
	var actions: Array[GameAction] = []
	
	# ====================================================
	# TIER 1 — 白色（基础）
	# Day 1 可用，共 6 张
	# 效果幅度：±5~10，低风险低回报
	# ====================================================
	
	actions.append(_create_action({
		action_id = "balance_tweak",
		action_name = "微调平衡性",
		description = "小幅调整角色数值，硬核玩家认可，其他群体无感",
		icon = "⚖️",
		tier = 1, unlock_day = 1,
		time_cost = 1, cooldown = 0,
		category = "数值调整",
		satisfaction_effects = {
			PlayerGroupType.HARDCORE: 8,
			PlayerGroupType.WHALE: -3,
			PlayerGroupType.F2P: 3,
			PlayerGroupType.CASUAL: 0
		},
		kpi_effects = {"rating": 3, "revenue": 2}
	}))
	
	actions.append(_create_action({
		action_id = "checkin_event",
		action_name = "七日签到活动",
		description = "每天签到领小奖励，休闲玩家和白嫖党开心",
		icon = "📅",
		tier = 1, unlock_day = 1,
		time_cost = 1, cooldown = 0,
		category = "活动运营",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 10,
			PlayerGroupType.F2P: 8,
			PlayerGroupType.HARDCORE: -5,
			PlayerGroupType.WHALE: 0
		},
		kpi_effects = {"retention": 5, "rating": 2, "revenue": -2}
	}))
	
	actions.append(_create_action({
		action_id = "ui_improve",
		action_name = "界面视觉优化",
		description = "更新UI界面风格，提升视觉体验，大家都喜欢",
		icon = "🎨",
		tier = 1, unlock_day = 1,
		time_cost = 2, cooldown = 1,
		category = "体验优化",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 8,
			PlayerGroupType.WHALE: 5,
			PlayerGroupType.F2P: 5,
			PlayerGroupType.HARDCORE: 3
		},
		kpi_effects = {"rating": 5, "retention": 2, "revenue": 1}
	}))
	
	actions.append(_create_action({
		action_id = "reduce_grind",
		action_name = "减负减负",
		description = "降低日常任务耗时，休闲玩家和白嫖党感谢",
		icon = "😌",
		tier = 1, unlock_day = 1,
		time_cost = 2, cooldown = 0,
		category = "体验优化",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 12,
			PlayerGroupType.F2P: 8,
			PlayerGroupType.HARDCORE: -8,
			PlayerGroupType.WHALE: -3
		},
		kpi_effects = {"retention": 6, "rating": 3, "revenue": -2}
	}))
	
	actions.append(_create_action({
		action_id = "community_mgmt",
		action_name = "社区安抚",
		description = "发公告道歉送福利，稳住玩家口碑",
		icon = "💬",
		tier = 1, unlock_day = 1,
		time_cost = 1, cooldown = 0,
		category = "体验优化",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 5,
			PlayerGroupType.F2P: 6,
			PlayerGroupType.WHALE: 4,
			PlayerGroupType.HARDCORE: 3
		},
		kpi_effects = {"rating": 6, "retention": 2, "revenue": 1}
	}))
	
	actions.append(_create_action({
		action_id = "minor_patch",
		action_name = "小型热更新",
		description = "修复几个小Bug，提升游戏稳定性",
		icon = "🔧",
		tier = 1, unlock_day = 1,
		time_cost = 1, cooldown = 0,
		category = "内容更新",
		satisfaction_effects = {
			PlayerGroupType.HARDCORE: 5,
			PlayerGroupType.F2P: 4,
			PlayerGroupType.CASUAL: 3,
			PlayerGroupType.WHALE: 2
		},
		kpi_effects = {"retention": 4, "rating": 3, "revenue": 1}
	}))
	
	# ---- TIER 1 新增卡片 ----
	
	actions.append(_create_action({
		action_id = "ad_placement",
		action_name = "广告投放",
		description = "在各大平台投放买量广告，流水涨了但玩家嫌广告多",
		icon = "📺",
		tier = 1, unlock_day = 1,
		time_cost = 1, cooldown = 1,
		category = "市场推广",
		satisfaction_effects = {
			PlayerGroupType.WHALE: 5,
			PlayerGroupType.HARDCORE: -4,
			PlayerGroupType.CASUAL: -6,
			PlayerGroupType.F2P: -8
		},
		kpi_effects = {"revenue": 8, "rating": -3, "retention": -2}
	}))
	
	actions.append(_create_action({
		action_id = "newbie_gift",
		action_name = "新人礼包升级",
		description = "大幅提升新手奖励，吸引新用户留存",
		icon = "🎁",
		tier = 1, unlock_day = 1,
		time_cost = 1, cooldown = 0,
		category = "活动运营",
		satisfaction_effects = {
			PlayerGroupType.F2P: 10,
			PlayerGroupType.CASUAL: 8,
			PlayerGroupType.WHALE: -3,
			PlayerGroupType.HARDCORE: -2
		},
		kpi_effects = {"retention": 7, "rating": 3, "revenue": -1}
	}))
	
	actions.append(_create_action({
		action_id = "cs_optimize",
		action_name = "客服响应优化",
		description = "升级客服团队，更快处理玩家投诉",
		icon = "🎧",
		tier = 1, unlock_day = 1,
		time_cost = 2, cooldown = 1,
		category = "体验优化",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 8,
			PlayerGroupType.F2P: 7,
			PlayerGroupType.WHALE: 6,
			PlayerGroupType.HARDCORE: 4
		},
		kpi_effects = {"rating": 7, "retention": 3, "revenue": 1}
	}))
	
	actions.append(_create_action({
		action_id = "daily_quest_revamp",
		action_name = "日常任务改版",
		description = "重做日常任务体系，玩法更丰富奖励更合理",
		icon = "📋",
		tier = 1, unlock_day = 1,
		time_cost = 2, cooldown = 0,
		category = "内容更新",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 10,
			PlayerGroupType.F2P: 8,
			PlayerGroupType.HARDCORE: 5,
			PlayerGroupType.WHALE: 2
		},
		kpi_effects = {"retention": 6, "rating": 4, "revenue": 2}
	}))
	
	# ====================================================
	# TIER 2 — 绿色（优秀）
	# Day 2 解锁，共 1 张
	# 效果幅度：±10~18，中等风险回报
	# ====================================================
	
	actions.append(_create_action({
		action_id = "pvp_event",
		action_name = "举办竞技大赛",
		description = "限时PVP赛事，硬核玩家狂喜，休闲玩家难受",
		icon = "🏆",
		tier = 2, unlock_day = 2,
		time_cost = 2, cooldown = 1,
		category = "活动运营",
		satisfaction_effects = {
			PlayerGroupType.HARDCORE: 18,
			PlayerGroupType.WHALE: 8,
			PlayerGroupType.F2P: 3,
			PlayerGroupType.CASUAL: -12
		},
		kpi_effects = {"retention": 6, "revenue": 5, "rating": -2}
	}))
	
	# ---- TIER 2 新增卡片 ----
	
	actions.append(_create_action({
		action_id = "social_media",
		action_name = "社交媒体运营",
		description = "在社交平台造势，吸引新用户关注",
		icon = "📱",
		tier = 2, unlock_day = 2,
		time_cost = 2, cooldown = 1,
		category = "市场推广",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 14,
			PlayerGroupType.F2P: 10,
			PlayerGroupType.HARDCORE: 6,
			PlayerGroupType.WHALE: 4
		},
		kpi_effects = {"revenue": 6, "retention": 5, "rating": 3}
	}))
	
	actions.append(_create_action({
		action_id = "festival_event",
		action_name = "节日限定活动",
		description = "推出节日主题活动和限定皮肤，全群体覆盖",
		icon = "🎊",
		tier = 2, unlock_day = 2,
		time_cost = 2, cooldown = 1,
		category = "活动运营",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 16,
			PlayerGroupType.WHALE: 12,
			PlayerGroupType.F2P: 10,
			PlayerGroupType.HARDCORE: -8
		},
		kpi_effects = {"revenue": 10, "retention": 4, "rating": 2}
	}))
	
	actions.append(_create_action({
		action_id = "price_tier_adj",
		action_name = "付费档位调整",
		description = "优化充值档位和礼包定价，刺激中氪消费",
		icon = "💳",
		tier = 2, unlock_day = 2,
		time_cost = 1, cooldown = 0,
		category = "数值调整",
		satisfaction_effects = {
			PlayerGroupType.WHALE: 15,
			PlayerGroupType.F2P: -12,
			PlayerGroupType.HARDCORE: -6,
			PlayerGroupType.CASUAL: 5
		},
		kpi_effects = {"revenue": 14, "rating": -4, "retention": -2}
	}))
	
	# ====================================================
	# TIER 3 — 蓝色（稀有）
	# Day 3 解锁，共 1 张
	# 效果幅度：±15~25，高风险高回报
	# ====================================================
	
	actions.append(_create_action({
		action_id = "new_free_content",
		action_name = "免费内容更新",
		description = "新副本/新角色免费开放，白嫖党和硬核玩家欢呼",
		icon = "🗺️",
		tier = 3, unlock_day = 3,
		time_cost = 3, cooldown = 2,
		category = "内容更新",
		satisfaction_effects = {
			PlayerGroupType.F2P: 22,
			PlayerGroupType.HARDCORE: 16,
			PlayerGroupType.CASUAL: 10,
			PlayerGroupType.WHALE: -10
		},
		kpi_effects = {"retention": 8, "rating": 8, "revenue": -8}
	}))
	
	# ---- TIER 3 新增卡片 ----
	
	actions.append(_create_action({
		action_id = "limited_gacha",
		action_name = "限时卡池UP",
		description = "上线限定角色/武器卡池，氪佬疯狂抽卡",
		icon = "🎰",
		tier = 3, unlock_day = 3,
		time_cost = 2, cooldown = 1,
		category = "活动运营",
		satisfaction_effects = {
			PlayerGroupType.WHALE: 24,
			PlayerGroupType.HARDCORE: 18,
			PlayerGroupType.F2P: -20,
			PlayerGroupType.CASUAL: -10
		},
		kpi_effects = {"revenue": 22, "rating": -6, "retention": -2}
	}))
	
	actions.append(_create_action({
		action_id = "ip_collab",
		action_name = "跨界IP联动",
		description = "与知名IP联动推出限定内容，话题度拉满",
		icon = "🤝",
		tier = 3, unlock_day = 3,
		time_cost = 3, cooldown = 2,
		category = "市场推广",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 22,
			PlayerGroupType.F2P: 18,
			PlayerGroupType.WHALE: 15,
			PlayerGroupType.HARDCORE: 12
		},
		kpi_effects = {"revenue": 12, "retention": 10, "rating": 8}
	}))
	
	actions.append(_create_action({
		action_id = "elite_tournament",
		action_name = "精英挑战赛",
		description = "高难度限时挑战副本，硬核玩家的狂欢",
		icon = "⚔️",
		tier = 3, unlock_day = 3,
		time_cost = 2, cooldown = 1,
		category = "内容更新",
		satisfaction_effects = {
			PlayerGroupType.HARDCORE: 24,
			PlayerGroupType.WHALE: 16,
			PlayerGroupType.F2P: -14,
			PlayerGroupType.CASUAL: -18
		},
		kpi_effects = {"retention": 10, "rating": -4, "revenue": 6}
	}))
	
	# ====================================================
	# TIER 4 — 金色（史诗）
	# Day 4 解锁，共 1 张
	# 效果幅度：±20~35，高风险高回报
	# ====================================================
	
	actions.append(_create_action({
		action_id = "recharge_carnival",
		action_name = "充值狂欢季",
		description = "限时累充双倍返利，氪金大佬疯狂充值，白嫖党怒骂",
		icon = "💎",
		tier = 4, unlock_day = 4,
		time_cost = 2, cooldown = 2,
		category = "活动运营",
		satisfaction_effects = {
			PlayerGroupType.WHALE: 30,
			PlayerGroupType.F2P: -25,
			PlayerGroupType.CASUAL: -12,
			PlayerGroupType.HARDCORE: 5
		},
		kpi_effects = {"revenue": 25, "rating": -7, "retention": -3}
	}))
	
	# ---- TIER 4 新增卡片 ----
	
	actions.append(_create_action({
		action_id = "celebrity_endorse",
		action_name = "明星代言合作",
		description = "签约当红明星代言，破圈效应拉满，成本极高",
		icon = "🌟",
		tier = 4, unlock_day = 4,
		time_cost = 3, cooldown = 2,
		category = "市场推广",
		satisfaction_effects = {
			PlayerGroupType.CASUAL: 32,
			PlayerGroupType.F2P: 20,
			PlayerGroupType.WHALE: 18,
			PlayerGroupType.HARDCORE: -22
		},
		kpi_effects = {"revenue": 20, "retention": 8, "rating": 5}
	}))
	
	actions.append(_create_action({
		action_id = "expansion_pack",
		action_name = "年度资料片发布",
		description = "大型DLC/资料片上线，全新世界开启",
		icon = "🌋",
		tier = 4, unlock_day = 4,
		time_cost = 3, cooldown = 3,
		category = "内容更新",
		satisfaction_effects = {
			PlayerGroupType.HARDCORE: 30,
			PlayerGroupType.F2P: 24,
			PlayerGroupType.CASUAL: 20,
			PlayerGroupType.WHALE: -20
		},
		kpi_effects = {"retention": 18, "rating": 12, "revenue": -12}
	}))
	
	# ====================================================
	# TIER 5 — 红色（传说）
	# Day 5 解锁，共 1 张
	# 效果幅度：±25~45，极端风险回报
	# ====================================================
	
	actions.append(_create_action({
		action_id = "massive_overhaul",
		action_name = "数值大洗牌",
		description = "全面重做数值体系——有人上天，有人入地，玩家社区炸锅",
		icon = "☠️",
		tier = 5, unlock_day = 5,
		time_cost = 3, cooldown = 3,
		category = "数值调整",
		satisfaction_effects = {
			PlayerGroupType.HARDCORE: 25,
			PlayerGroupType.F2P: 20,
			PlayerGroupType.WHALE: -30,
			PlayerGroupType.CASUAL: -15
		},
		kpi_effects = {"rating": -10, "retention": 5, "revenue": -10}
	}))
	
	# ---- TIER 5 新增卡片 ----
	
	actions.append(_create_action({
		action_id = "ai_matchmaking",
		action_name = "AI智能匹配系统",
		description = "引入AI匹配算法，技术革新颠覆游戏体验",
		icon = "🤖",
		tier = 5, unlock_day = 5,
		time_cost = 3, cooldown = 3,
		category = "体验优化",
		satisfaction_effects = {
			PlayerGroupType.HARDCORE: 35,
			PlayerGroupType.CASUAL: 28,
			PlayerGroupType.F2P: 20,
			PlayerGroupType.WHALE: -25
		},
		kpi_effects = {"retention": 20, "rating": 15, "revenue": -15}
	}))
	
	return actions

## 按动作ID查找
static func get_action_by_id(action_id: String) -> GameAction:
	for action: GameAction in get_all_actions():
		if action.action_id == action_id:
			return action
	return null

## 按等级过滤
static func get_actions_by_tier(tier: int) -> Array[GameAction]:
	var result: Array[GameAction] = []
	for action: GameAction in get_all_actions():
		if action.tier == tier:
			result.append(action)
	return result

## 按分类过滤
static func get_actions_by_category(category: String) -> Array[GameAction]:
	var result: Array[GameAction] = []
	for action: GameAction in get_all_actions():
		if action.category == category:
			result.append(action)
	return result

## 按等级列表过滤（一次查询多个tier）
static func get_actions_by_tiers(tiers: Array[int]) -> Array[GameAction]:
	var result: Array[GameAction] = []
	for action: GameAction in get_all_actions():
		if action.tier in tiers:
			result.append(action)
	return result

## 获取某一tier的全部卡片
static func get_actions_of_tier(t: int) -> Array[GameAction]:
	return get_actions_by_tiers([t])

static func _create_action(data: Dictionary) -> GameAction:
	var action := GameAction.new()
	action.action_id = data.get("action_id", "")
	action.action_name = data.get("action_name", "")
	action.description = data.get("description", "")
	action.icon = data.get("icon", "📋")
	action.tier = data.get("tier", 1)
	action.unlock_day = data.get("unlock_day", 1)
	action.time_cost = data.get("time_cost", 1)
	action.cooldown = data.get("cooldown", 0)
	action.satisfaction_effects = data.get("satisfaction_effects", {})
	action.kpi_effects = data.get("kpi_effects", {})
	action.category = data.get("category", "")
	return action
