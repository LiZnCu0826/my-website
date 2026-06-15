<template>
  <header class="app-header" :class="{ 'header-scrolled': isScrolled }">
    <div class="header-wrapper">
      <!-- Logo/名称 -->
      <a href="#home" class="header-logo" @click="onMenuClick('home')">
        <span class="logo-text">李欣桐</span>
      </a>

      <!-- 桌面端导航 -->
      <nav class="header-nav">
        <a
          v-for="item in menuItems"
          :key="item.key"
          :href="'#' + item.key"
          :class="['nav-item', { active: activeMenu === item.key }]"
          @click="onMenuClick(item.key)"
        >
          {{ item.label }}
        </a>
      </nav>

      <!-- 移动端菜单按钮 -->
      <div class="mobile-menu-btn" @click="drawerVisible = true">
        <t-icon name="menu" size="24px" />
      </div>
    </div>

    <!-- 移动端抽屉菜单 -->
    <t-drawer
      v-model:visible="drawerVisible"
      :footer="false"
      size="280px"
      placement="right"
      :z-index="2000"
    >
      <nav class="mobile-nav">
        <a
          v-for="item in menuItems"
          :key="item.key"
          :href="'#' + item.key"
          :class="['mobile-nav-item', { active: activeMenu === item.key }]"
          @click="onMenuClick(item.key); drawerVisible = false"
        >
          {{ item.label }}
        </a>
      </nav>
    </t-drawer>
  </header>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const props = defineProps({
  activeMenu: {
    type: String,
    default: 'home'
  }
})

const emit = defineEmits(['menu-change'])

const isScrolled = ref(false)
const drawerVisible = ref(false)

const menuItems = [
  { key: 'home', label: '首页' },
  { key: 'about', label: '关于我' },
  { key: 'skills', label: '技能' },
  { key: 'projects', label: '项目' },
  { key: 'experience', label: '经历' },
  { key: 'contact', label: '联系我' },
]

const onMenuClick = (key) => {
  emit('menu-change', key)
}

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.app-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  padding: 0 24px;
  transition: all 0.3s ease;
  background: transparent;
}

.header-scrolled {
  background: rgba(255, 255, 255, 0.92);
  backdrop-filter: blur(20px);
  box-shadow: 0 1px 0 var(--border-color);
}

.header-wrapper {
  max-width: var(--max-width);
  margin: 0 auto;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.header-logo {
  font-size: 1.4rem;
  font-weight: 700;
  background: var(--gradient-primary);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.header-nav {
  display: flex;
  gap: 8px;
}

.nav-item {
  padding: 8px 16px;
  border-radius: 8px;
  font-size: 0.9rem;
  color: var(--text-secondary);
  transition: all 0.3s ease;
  cursor: pointer;
}

.nav-item:hover {
  color: var(--primary-color);
  background: var(--primary-extra-light);
}

.nav-item.active {
  color: var(--primary-color);
  background: rgba(0, 82, 217, 0.1);
}

.mobile-menu-btn {
  display: none;
  cursor: pointer;
  color: var(--text-primary);
}

.mobile-nav {
  display: flex;
  flex-direction: column;
  gap: 8px;
  padding-top: 24px;
}

.mobile-nav-item {
  display: block;
  padding: 12px 16px;
  border-radius: 8px;
  font-size: 1rem;
  color: var(--text-secondary);
  transition: all 0.3s ease;
  cursor: pointer;
}

.mobile-nav-item:hover,
.mobile-nav-item.active {
  color: var(--primary-color);
  background: rgba(0, 82, 217, 0.1);
}

@media (max-width: 768px) {
  .header-nav {
    display: none;
  }

  .mobile-menu-btn {
    display: block;
  }
}
</style>
