<template>
  <section id="home" class="hero-section">
    <div class="hero-bg"></div>
    <div class="section-wrapper hero-content">
      <div class="hero-text">
        <p class="hero-greeting">👋 你好，我是</p>
        <h1 class="hero-name">李欣桐</h1>
        <p class="hero-title">华南理工大学 · 会计学</p>
        <p class="hero-desc">
          探索 AI 工具的无限可能，热衷于将其融入跨学科实践。
          用智能技术打破专业壁垒，让创意在多个领域自由生长。
        </p>
        <div class="hero-actions">
          <t-button theme="primary" size="large" @click="scrollTo('projects')">
            查看作品
          </t-button>
          <t-button theme="default" variant="outline" size="large" @click="scrollTo('contact')">
            联系我
          </t-button>
        </div>
      </div>
      <div class="hero-avatar">
        <img src="/assets/avatar.jpg" alt="李欣桐" class="avatar-img" />
      </div>
    </div>
  </section>
</template>

<script setup>
const scrollTo = (id) => {
  const el = document.getElementById(id)
  if (el) {
    el.scrollIntoView({ behavior: 'smooth' })
  }
}
</script>

<style scoped>
.hero-section {
  min-height: 100vh;
  display: flex;
  align-items: center;
  position: relative;
  overflow: hidden;
}

.hero-bg {
  position: absolute;
  inset: 0;
  background: var(--gradient-hero);
  z-index: -1;
}

.hero-bg::after {
  content: '';
  position: absolute;
  top: -50%;
  right: -20%;
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, rgba(21, 101, 192, 0.08) 0%, transparent 70%);
  border-radius: 50%;
}

.hero-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 60px;
}

.hero-text {
  flex: 1;
  max-width: 600px;
}

.hero-greeting {
  font-size: 1.2rem;
  color: var(--text-secondary);
  margin-bottom: 12px;
}

.hero-name {
  font-size: 3.5rem;
  font-weight: 800;
  line-height: 1.2;
  margin-bottom: 12px;
  color: var(--text-primary);
}

.hero-title {
  font-size: 1.3rem;
  color: var(--text-primary);
  margin-bottom: 16px;
  font-weight: 500;
}

.hero-desc {
  font-size: 1rem;
  color: var(--text-secondary);
  line-height: 1.8;
  margin-bottom: 32px;
}

.hero-actions {
  display: flex;
  gap: 16px;
}

.hero-avatar {
  flex-shrink: 0;
}

.avatar-img {
  width: 300px;
  height: 300px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid var(--primary-color);
  box-shadow: 0 8px 32px rgba(21, 101, 192, 0.15);
}

@media (max-width: 768px) {
  .hero-section {
    text-align: center;
    padding-top: 80px;
  }

  .hero-content {
    flex-direction: column-reverse;
    gap: 40px;
  }

  .hero-name {
    font-size: 2.2rem;
  }

  .hero-actions {
    justify-content: center;
  }

  .avatar-img {
    width: 200px;
    height: 200px;
  }
}
</style>
