import { createRouter, createWebHashHistory } from 'vue-router'
import HomePage from './components/HomePage.vue'
import ProjectDetail from './components/ProjectDetail.vue'
import CompetitionDetail from './components/CompetitionDetail.vue'
import XpengDetail from './components/XpengDetail.vue'

const routes = [
  { path: '/', component: HomePage },
  { path: '/project/future-penguin', component: ProjectDetail },
  { path: '/project/crazy-planner', component: CompetitionDetail },
  { path: '/project/xpeng-parking', component: XpengDetail },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes,
  scrollBehavior() {
    return { top: 0, behavior: 'instant' }
  },
})

export default router
