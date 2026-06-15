<template>
  <section id="about" class="section about-section">
    <div class="section-wrapper">
      <div class="section-header">
        <h2 class="section-title">关于我</h2>
        <p class="section-subtitle">这里可以介绍你的个人背景、职业经历和兴趣爱好</p>
      </div>

      <div class="about-content">
        <div class="about-text">
          <p>
            我是一名华南理工大学会计学专业的本科生，对数据分析、财务管理和信息技术充满热情。
            致力于将专业知识与数字化技能相结合，探索财务科技领域的创新应用。
            在学习之余，我积极了解和使用各类AI工具，探索AI赋能学习与工作的更多可能。
          </p>
          <p>
            我相信跨学科的思维方式能够带来独特的视角和解决方案。
            无论是财务分析还是代码实现，我都追求严谨与卓越，
            期待在未来的职业道路上不断成长，为社会创造价值。
          </p>

          <div class="about-stats">
            <div v-for="stat in stats" :key="stat.label" class="stat-item card-hover">
              <span class="stat-value">{{ stat.value }}</span>
              <span class="stat-label">{{ stat.label }}</span>
            </div>
          </div>
        </div>

        <div class="about-info-card">
          <t-card :bordered="false" class="info-card">
            <template #header>
              <h3 class="info-card-title">基本信息</h3>
            </template>
            <div class="info-list">
              <div v-for="item in infoItems" :key="item.label" class="info-item">
                <span class="info-label">{{ item.label }}</span>
                <span class="info-value">{{ item.value }}</span>
              </div>
            </div>
          </t-card>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const stats = [
  { label: '年龄', value: '21' },
  { label: '完成项目', value: '20+' },
  { label: '满意客户', value: '15+' },
  { label: '获得奖项', value: '5+' },
]

const infoItems = [
  { label: '姓名', value: '李欣桐' },
  { label: '性别', value: '男' },
  { label: '邮箱', value: '2553083632@qq.com' },
  { label: '电话', value: '18909919365' },
  { label: '抖音', value: 'LiZnCu25650' },
  { label: '学历', value: '本科 · 华南理工大学 · 会计学' },
]
</script>

<style scoped>
.about-content {
  display: grid;
  grid-template-columns: 1.2fr 0.8fr;
  gap: 48px;
  align-items: start;
}

.about-text p {
  color: var(--text-secondary);
  margin-bottom: 16px;
  line-height: 1.8;
  font-size: 0.95rem;
}

.about-stats {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  margin-top: 32px;
}

.stat-item {
  background: var(--card-bg);
  border: 1px solid var(--border-color);
  border-radius: 12px;
  padding: 20px 16px;
  text-align: center;
  box-shadow: var(--card-shadow);
}

.stat-value {
  display: block;
  font-size: 1.8rem;
  font-weight: 700;
  color: var(--primary-color);
  margin-bottom: 4px;
}

.stat-label {
  display: block;
  font-size: 0.85rem;
  color: var(--text-muted);
}

.about-info-card {
  position: sticky;
  top: 80px;
}

.info-card {
  background: var(--card-bg) !important;
  border: 1px solid var(--border-color) !important;
  border-radius: 12px !important;
  box-shadow: var(--card-shadow) !important;
}

.info-card-title {
  color: var(--text-primary);
  font-size: 1.1rem;
}

.info-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.info-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--border-color);
}

.info-item:last-child {
  border-bottom: none;
  padding-bottom: 0;
}

.info-label {
  color: var(--text-muted);
  font-size: 0.9rem;
}

.info-value {
  color: var(--text-primary);
  font-size: 0.9rem;
  font-weight: 500;
}

@media (max-width: 768px) {
  .about-content {
    grid-template-columns: 1fr;
    gap: 32px;
  }

  .about-stats {
    grid-template-columns: repeat(2, 1fr);
  }

  .about-info-card {
    position: static;
  }
}
</style>
