<template>
  <section id="skills" class="section skills-section">
    <div class="section-wrapper">
      <div class="section-header">
        <h2 class="section-title">专业技能</h2>
        <p class="section-subtitle">以下是我在学习和实践中掌握的核心技能</p>
      </div>

      <div class="skills-grid">
        <div v-for="category in skillCategories" :key="category.name" class="skill-category card-hover">
          <t-card :bordered="false" class="skill-card">
            <template #header>
              <div class="skill-category-header">
                <t-icon :name="category.icon" size="24px" class="skill-icon" />
                <h3 class="skill-category-name">{{ category.name }}</h3>
              </div>
            </template>
            <div class="skill-tags">
              <t-tag
                v-for="skill in category.skills"
                :key="skill.name"
                :theme="getTagTheme(skill.level)"
                variant="light"
                class="skill-tag"
              >
                {{ skill.name }}
              </t-tag>
            </div>
          </t-card>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const getTagTheme = (level) => {
  const themes = { primary: 'primary', advanced: 'success', intermediate: 'warning' }
  return themes[level] || 'default'
}

const skillCategories = [
  {
    name: 'AI工具 & 应用',
    icon: 'tips',
    skills: [
      { name: 'CodeBuddy', level: 'primary' },
      { name: '腾讯文档AI', level: 'primary' },
      { name: 'WorkBuddy', level: 'advanced' },
      { name: 'Prompt Engineering', level: 'advanced' },
      { name: 'AI办公自动化', level: 'primary' },
    ]
  },
  {
    name: '数据分析',
    icon: 'chart-bar',
    skills: [
      { name: 'Excel高级应用', level: 'primary' },
      { name: 'Python', level: 'intermediate' },
      { name: '财务数据分析', level: 'advanced' },
      { name: '数据可视化', level: 'advanced' },
      { name: '数据建模', level: 'intermediate' },
    ]
  },
  {
    name: '会计学专业知识',
    icon: 'code',
    skills: [
      { name: '财务会计', level: 'primary' },
      { name: '管理会计', level: 'advanced' },
      { name: '审计学', level: 'advanced' },
      { name: '税法实务', level: 'advanced' },
      { name: '财务分析', level: 'intermediate' },
    ]
  },
  {
    name: '综合能力',
    icon: 'user',
    skills: [
      { name: '跨学科思维', level: 'primary' },
      { name: '项目管理', level: 'advanced' },
      { name: '文档撰写', level: 'primary' },
      { name: 'Git', level: 'advanced' },
      { name: 'Godot游戏引擎', level: 'intermediate' },
    ]
  },
]
</script>

<style scoped>
.skills-section {
  background: var(--bg-section-alt);
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 24px;
}

.skill-card {
  background: var(--card-bg) !important;
  border: 1px solid var(--border-color) !important;
  border-radius: 12px !important;
  box-shadow: var(--card-shadow) !important;
}

.skill-category-header {
  display: flex;
  align-items: center;
  gap: 12px;
}

.skill-icon {
  color: var(--primary-color);
}

.skill-category-name {
  color: var(--text-primary);
  font-size: 1.1rem;
  font-weight: 600;
}

.skill-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.skill-tag {
  font-size: 0.85rem;
}

@media (max-width: 768px) {
  .skills-grid {
    grid-template-columns: 1fr;
  }
}
</style>
