## 全局事件总线
## 跨场景解耦通信，所有信号在此定义
extends Node

## ===== 游戏生命周期 =====

## 游戏开始
signal game_started

## 游戏结束（被辞退/成功退休）
## [param success: bool] true=成功退休, false=被辞退
signal game_ended(success: bool)

## 天数变更
## [param day: int] 当前天数
signal day_changed(day: int)

## 当天时间变更（一个天被分为若干时间单位）
signal time_changed(current_time: int, max_time: int)

## 回合结束（选择了一个动作并执行完毕）
signal turn_ended

## ===== 满意度系统 =====

## 玩家群体满意度变化
## [param group: String] 群体类型
## [param old_value: float] 旧值
## [param new_value: float] 新值
signal satisfaction_changed(group: String, old_value: float, new_value: float)

## 群体满意度达到危险阈值
signal satisfaction_danger(group: String, value: float)

## 群体满意度达到优秀
signal satisfaction_excellent(group: String, value: float)

## ===== KPI 系统 =====

## KPI 任务更新
signal kpi_updated

## KPI 完成度变更
signal kpi_progress_changed(kpi_id: String, kpi_type: String, current: float, target: float)

## KPI 评估结束（每天结束时）
signal kpi_evaluated(kpi_id: String, passed: bool)

## ===== 动作执行 =====

## 玩家执行了一个运营动作
## [param action_id: String] 动作ID
signal action_executed(action_id: String)

## 动作冷却更新
signal cooldown_updated

## ===== 卡槽系统 =====

## 卡槽被填充
## [param slot_index: int] 卡槽序号
## [param action_id: String] 动作ID
signal slot_filled(slot_index: int, action_id: String)

## 卡槽被移除
## [param slot_index: int] 被移除的卡槽序号
signal slot_removed(slot_index: int)

## 所有卡槽已填满
signal all_slots_filled

## ===== 结算系统 =====

## 统一结算开始
signal settlement_started

## 结算步骤推进
## [param step: int] 第几步
## [param action_id: String] 当前执行的动作ID
signal settlement_step(step: int, action_id: String)

## 结算完成
signal settlement_completed

## ===== UI 相关 =====

## 播放通知
signal notification(text: String, type: String)
