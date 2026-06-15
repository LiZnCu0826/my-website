<template>
  <section id="projects" class="section projects-section">
    <div class="section-wrapper">
      <div class="section-header">
        <h2 class="section-title">项目作品</h2>
        <p class="section-subtitle">这里展示我参与开发的部分项目</p>
      </div>

      <!-- 项目筛选标签 -->
      <div class="project-filters">
        <t-tag
          v-for="filter in filters"
          :key="filter"
          :theme="activeFilter === filter ? 'primary' : 'default'"
          variant="light"
          class="filter-tag"
          @click="activeFilter = filter"
        >
          {{ filter }}
        </t-tag>
      </div>

      <!-- 项目列表 -->
      <div class="projects-grid">
        <div
          v-for="project in filteredProjects"
          :key="project.id"
          class="project-card card-hover"
        >
          <t-card :bordered="false" class="project-card-inner">
            <div class="project-image">
              <img v-if="project.image" :src="project.image" :alt="project.name" class="project-img" />
              <t-icon v-else name="app" size="48px" class="project-icon" />
            </div>
            <template #header>
              <div class="project-header">
                <h3 class="project-name">{{ project.name }}</h3>
                <div class="project-header-bottom">
                  <t-tag :theme="project.tagTheme" variant="light" size="small">
                    {{ project.category }}
                  </t-tag>
                  <a v-if="project.detailRoute" href="javascript:void(0)" class="detail-link" @click.prevent.stop="goDetail(project.detailRoute)">
                    查看详情 <t-icon name="link" size="14px" />
                  </a>
                  <a v-else-if="project.link" :href="project.link" target="_blank" class="detail-link">
                    查看详情 <t-icon name="link" size="14px" />
                  </a>
                </div>
              </div>
            </template>
            <p class="project-desc">{{ project.description }}</p>
            <div class="project-tech">
              <t-tag
                v-for="tech in project.techs"
                :key="tech"
                variant="outline"
                size="small"
              >
                {{ tech }}
              </t-tag>
            </div>
          </t-card>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const goDetail = (path) => {
  router.push(path)
}

const activeFilter = ref('全部')

const filters = ['全部', '项目', '比赛', '文章']

const projects = [
  {
    id: 1,
    name: '腾讯 AI-HR 培训生',
    category: '项目',
    tagTheme: 'primary',
    image: '/future-penguin.png',
    description: '2026/05 - 2026/06 | 熟练运用 CodeBuddy、腾讯文档AI、WorkBuddy 等 AI 办公工具，大幅提升工作处理效率。最终以网页形式交付大学生专属成长陪伴 Demo——"未来鹅"。',
    techs: ['CodeBuddy', '腾讯文档AI', 'WorkBuddy', 'AI办公'],
    detailRoute: '/project/future-penguin',
  },
  {
    id: 2,
    name: '网易高校 MINI GAME 挑战赛',
    category: '比赛',
    tagTheme: 'warning',
    image: '/crazy-planner-card-cover.png',
    description: '参加网易高校 MINI GAME 挑战赛，独立设计并开发轻策略模拟游戏《策划也疯狂》——一款以游戏运营策划为题材的卡牌选择模拟器。最终交付网页可玩 Demo 及完整设计文档。',
    techs: ['HTML/CSS/JS', '游戏设计', '卡牌策略', 'Web前端'],
    detailRoute: '/project/crazy-planner',
  },
  {
    id: 3,
    name: '小鹏 AI 公开赛',
    category: '比赛',
    tagTheme: 'success',
    image: '/xpeng-cover.png',
    description: '参加小鹏 AI 公开赛，提出物理AI概念提案——《AI自动挪车/泊车》。依托物理AI技术打造全自动智能挪车泊车系统，解决老旧小区停车难、挪车烦的民生痛点，实现科技平权。',
    techs: ['物理AI', '环境感知', '自主控制', '智能出行'],
    detailRoute: '/project/xpeng-parking',
  },
]

const filteredProjects = computed(() => {
  if (activeFilter.value === '全部') return projects
  return projects.filter(p => p.category === activeFilter.value)
})
</script>

<style scoped>
.projects-section {
  background: var(--bg-section);
}

.project-filters {
  display: flex;
  justify-content: center;
  gap: 12px;
  margin-bottom: 40px;
  flex-wrap: wrap;
}

.filter-tag {
  cursor: pointer;
  padding: 6px 16px;
  font-size: 0.9rem;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

.project-card-inner {
  background: var(--card-bg) !important;
  border: 1px solid var(--border-color) !important;
  border-radius: 12px !important;
  box-shadow: var(--card-shadow) !important;
  height: 100%;
  padding: 28px !important;
}

.project-card-inner :deep(.t-card__header) {
  padding: 0 !important;
}

.project-card-inner :deep(.t-card__header-wrapper) {
  padding: 0 0 12px 0 !important;
}

.project-card-inner :deep(.t-card__body) {
  padding: 0 !important;
}

.project-image {
  width: 100%;
  height: 160px;
  background: linear-gradient(135deg, var(--primary-extra-light), rgba(21, 101, 192, 0.08));
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 16px;
}

.project-icon {
  color: var(--primary-light);
}

.project-img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  border-radius: 8px;
  padding: 16px;
}

.project-header {
  display: flex;
  flex-direction: column;
  gap: 10px;
  width: 100%;
}

.project-header-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-left: 20px;
}

.project-header-bottom :deep(.t-tag) {
  font-size: 0.9rem;
}

.project-name {
  color: var(--text-primary);
  font-size: 1.05rem;
  font-weight: 600;
  margin: 0;
  padding: 0 20px;
}

.detail-link {
  color: var(--primary-color);
  font-size: 0.95rem;
  font-weight: 500;
  text-decoration: none;
  display: flex;
  align-items: center;
  gap: 4px;
  white-space: nowrap;
  transition: opacity 0.2s ease;
  cursor: pointer;
  user-select: none;
}

.detail-link:hover {
  opacity: 0.75;
}

.project-desc {
  color: var(--text-secondary);
  font-size: 0.9rem;
  line-height: 1.7;
  margin-bottom: 16px;
}

.project-tech {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  margin-bottom: 8px;
}

@media (max-width: 1024px) {
  .projects-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 640px) {
  .projects-grid {
    grid-template-columns: 1fr;
  }
}
</style>
