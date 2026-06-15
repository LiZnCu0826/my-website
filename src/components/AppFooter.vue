<template>
  <footer class="app-footer">
    <div class="section-wrapper footer-content">
      <div class="footer-top">
        <!-- Logo -->
        <div class="footer-brand">
          <span class="footer-logo">李欣桐</span>
          <p class="footer-desc">用AI探索边界，以专业创造价值。</p>
        </div>

        <!-- 快速链接 -->
        <div class="footer-links">
          <h4 class="footer-column-title">快速导航</h4>
          <ul>
            <li v-for="item in menuItems" :key="item.key">
              <a :href="'#' + item.key">{{ item.label }}</a>
            </li>
          </ul>
        </div>

        <!-- 联系方式 -->
        <div class="footer-contact">
          <h4 class="footer-column-title">联系方式</h4>
          <ul>
            <li>📧 2553083632@qq.com</li>
            <li>📱 18909919365</li>
          </ul>
        </div>
      </div>

      <!-- 底部版权 -->
      <div class="footer-bottom">
        <p>&copy; {{ currentYear }} 李欣桐. All rights reserved.</p>
      </div>
    </div>
  </footer>
</template>

<script setup>
const currentYear = new Date().getFullYear()

const menuItems = [
  { key: 'home', label: '首页' },
  { key: 'about', label: '关于我' },
  { key: 'skills', label: '技能' },
  { key: 'projects', label: '项目' },
  { key: 'experience', label: '经历' },
  { key: 'contact', label: '联系我' },
]
</script>

<style scoped>
.app-footer {
  background: var(--text-primary);
  border-top: 1px solid var(--border-color);
  padding: 60px 0 0;
}

.footer-top {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr;
  gap: 48px;
  padding-bottom: 40px;
}

.footer-logo {
  font-size: 1.5rem;
  font-weight: 700;
  color: #ffffff;
  margin-bottom: 12px;
  display: inline-block;
}

.footer-desc {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.9rem;
  max-width: 300px;
}

.footer-column-title {
  color: #ffffff;
  font-size: 0.95rem;
  font-weight: 600;
  margin-bottom: 16px;
}

.footer-links ul,
.footer-contact ul {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.footer-links a {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.9rem;
  transition: color 0.3s ease;
}

.footer-links a:hover {
  color: var(--primary-light);
}

.footer-contact li {
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.9rem;
}

.footer-bottom {
  padding: 24px 0;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  text-align: center;
}

.footer-bottom p {
  color: rgba(255, 255, 255, 0.4);
  font-size: 0.85rem;
}

@media (max-width: 768px) {
  .footer-top {
    grid-template-columns: 1fr;
    gap: 32px;
  }

  .app-footer {
    padding-top: 40px;
  }
}
</style>
