## KPI 任务数据库
## 难度平衡版：5张卡认真选可达成~2项，全选最优可达成3项
class_name KpiDatabase
extends Resource

static func get_all_kpis() -> Array[KpiDefinition]:
	var kpis: Array[KpiDefinition] = []
	
	kpis.append(_create_kpi({
		kpi_id = "day_1",
		kpi_name = "新手上任",
		description = "老板说先看看你的能力……虽然第一天也没什么流水压力",
		day = 1,
		revenue_target = 8.0,
		retention_target = 20.0,
		rating_target = 22.0,
		penalty_description = "老板皱了皱眉",
		penalty_score = 3
	}))
	
	kpis.append(_create_kpi({
		kpi_id = "day_2",
		kpi_name = "稳住基本盘",
		description = "营收有点下滑，老板开始关注了",
		day = 2,
		revenue_target = 14.0,
		retention_target = 20.0,
		rating_target = 18.0,
		penalty_description = "老板在群里@了你",
		penalty_score = 5
	}))
	
	kpis.append(_create_kpi({
		kpi_id = "day_3",
		kpi_name = "月度汇报",
		description = "月初要交数据了——够不够好看？",
		day = 3,
		revenue_target = 22.0,
		retention_target = 18.0,
		rating_target = 20.0,
		penalty_description = "老板要你下周交一份复盘报告",
		penalty_score = 8
	}))
	
	kpis.append(_create_kpi({
		kpi_id = "day_4",
		kpi_name = "玩家炸锅",
		description = "社区炸了！你必须做点什么平息众怒",
		day = 4,
		revenue_target = 10.0,
		retention_target = 25.0,
		rating_target = 24.0,
		penalty_description = "差评如潮，老板很生气",
		penalty_score = 10
	}))
	
	kpis.append(_create_kpi({
		kpi_id = "day_5",
		kpi_name = "版本更新",
		description = "大版本更新，成败在此一举",
		day = 5,
		revenue_target = 30.0,
		retention_target = 22.0,
		rating_target = 24.0,
		penalty_description = "版本事故，扣绩效！",
		penalty_score = 12
	}))
	
	kpis.append(_create_kpi({
		kpi_id = "day_6",
		kpi_name = "流水大考",
		description = "季度末冲流水，老板要好看的财报",
		day = 6,
		revenue_target = 45.0,
		retention_target = 16.0,
		rating_target = 14.0,
		penalty_description = "营收不达标，年终奖堪忧",
		penalty_score = 16
	}))
	
	kpis.append(_create_kpi({
		kpi_id = "day_7",
		kpi_name = "至暗时刻",
		description = "所有问题同时爆发，你能撑过去吗？",
		day = 7,
		revenue_target = 35.0,
		retention_target = 20.0,
		rating_target = 20.0,
		penalty_description = "你开始怀疑自己适不适合这行了",
		penalty_score = 20
	}))
	
	return kpis

static func get_kpi_by_day(day: int) -> KpiDefinition:
	for kpi: KpiDefinition in get_all_kpis():
		if kpi.day == day:
			return kpi
	return null

static func get_total_days() -> int:
	return get_all_kpis().size()

static func _create_kpi(data: Dictionary) -> KpiDefinition:
	var kpi := KpiDefinition.new()
	kpi.kpi_id = data.get("kpi_id", "")
	kpi.kpi_name = data.get("kpi_name", "")
	kpi.description = data.get("description", "")
	kpi.day = data.get("day", 1)
	kpi.revenue_target = data.get("revenue_target", 0.0)
	kpi.retention_target = data.get("retention_target", 0.0)
	kpi.rating_target = data.get("rating_target", 0.0)
	kpi.penalty_description = data.get("penalty_description", "")
	kpi.penalty_score = data.get("penalty_score", 0)
	return kpi
