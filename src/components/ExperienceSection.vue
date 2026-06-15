<template>
  <section id="experience" class="section experience-section">
    <div class="section-wrapper">
      <div class="section-header">
        <h2 class="section-title">实习经历</h2>
        <p class="section-subtitle">在实践中积累经验，探索职业方向</p>
      </div>

      <div class="timeline">
        <div v-for="(item, index) in experiences" :key="index" class="timeline-item">
          <!-- 时间线节点 -->
          <div class="timeline-dot">
            <div class="dot-inner" :class="{ active: index === 0 }"></div>
          </div>

          <!-- 时间标签 -->
          <div class="timeline-period">
            <t-tag theme="primary" variant="light">{{ item.period }}</t-tag>
          </div>

          <!-- 内容卡片 -->
          <div class="timeline-content card-hover">
            <t-card :bordered="false" class="experience-card">
              <template #header>
                <div class="exp-header">
                  <h3 class="exp-title">{{ item.title }}</h3>
                  <span class="exp-company">{{ item.company }}</span>
                </div>
              </template>
              <p class="exp-desc">{{ item.description }}</p>
              <div class="exp-details" v-if="item.details">
                <ul>
                  <li v-for="(detail, di) in item.details" :key="di">
                    <t-icon name="check-circle" size="16px" class="detail-icon" />
                    {{ detail }}
                  </li>
                </ul>
              </div>
            </t-card>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const experiences = [
  {
    period: '2025/12 - 2026/03',
    title: '商务运营实习生',
    company: '小型制造业企业',
    description: '负责供应链资源维护与市场策略支持，以数据驱动运营决策，助力业绩增长。',
    details: [
      '维护 10+ 实木贴皮品类合作厂商与渠道关系，对接日常商务流程，确保合作规范落地执行',
      '每周调研竞品价格与活动动态，系统整理数据支撑定价与促销策略制定，入职一个月推动品类销售额提升 5%',
      '主动对接生产厂商争取新品首发支持与促销资源倾斜，协助团队超额完成月度销售目标',
    ]
  },
  {
    period: '2025/07 - 2025/09',
    title: '会计助理实习生',
    company: '小型制造业企业',
    description: '负责企业网银日常操作与资金支付流程管理，严格执行内部风控制度，确保资金安全。',
    details: [
      '每日通过制单盾登录企业网银，独立完成付款指令录入、账户余额查询及交易流水监控，月均处理付款业务 80-120 笔',
      '严格执行三盾分级授权机制：10 万元以内业务经复核盾二次确认汇出，10 万元以上业务叠加主管盾终审复核，实习期间实现资金支付零差错',
    ]
  },
]
</script>

<style scoped>
.experience-section {
  background: var(--bg-section);
}

.timeline {
  position: relative;
  max-width: 800px;
  margin: 0 auto;
}

/* 时间线竖线 */
.timeline::before {
  content: '';
  position: absolute;
  left: 24px;
  top: 0;
  bottom: 0;
  width: 2px;
  background: var(--border-color);
}

.timeline-item {
  position: relative;
  padding-left: 64px;
  padding-bottom: 48px;
}

.timeline-item:last-child {
  padding-bottom: 0;
}

/* 时间节点 */
.timeline-dot {
  position: absolute;
  left: 0;
  top: 8px;
  width: 48px;
  height: 48px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.dot-inner {
  width: 14px;
  height: 14px;
  border-radius: 50%;
  background: var(--border-color);
  border: 3px solid var(--bg-main);
  z-index: 1;
  transition: all 0.3s ease;
}

.dot-inner.active {
  background: var(--primary-color);
  box-shadow: 0 0 12px rgba(21, 101, 192, 0.4);
}

/* 时间标签 */
.timeline-period {
  margin-bottom: 12px;
}

/* 内容卡片 */
.experience-card {
  background: var(--card-bg) !important;
  border: 1px solid var(--border-color) !important;
  border-radius: 12px !important;
  box-shadow: var(--card-shadow) !important;
}

.exp-header {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  flex-wrap: wrap;
  gap: 8px;
}

.exp-title {
  color: var(--text-primary);
  font-size: 1.05rem;
  font-weight: 600;
}

.exp-company {
  color: var(--text-muted);
  font-size: 0.85rem;
}

.exp-desc {
  color: var(--text-secondary);
  font-size: 0.9rem;
  margin-bottom: 12px;
  line-height: 1.6;
}

.exp-details ul {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.exp-details li {
  color: var(--text-secondary);
  font-size: 0.85rem;
  display: flex;
  align-items: flex-start;
  gap: 8px;
  line-height: 1.5;
}

.detail-icon {
  color: var(--primary-color);
  flex-shrink: 0;
  margin-top: 2px;
}

@media (max-width: 640px) {
  .timeline-item {
    padding-left: 48px;
  }

  .timeline::before {
    left: 18px;
  }

  .timeline-dot {
    left: -6px;
    width: 36px;
  }

  .exp-header {
    flex-direction: column;
    gap: 4px;
  }
}
</style>
