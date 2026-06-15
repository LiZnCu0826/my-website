<template>
  <div class="app-container">
    <AppHeader :active-menu="activeMenu" @menu-change="handleMenuChange" />
    
    <main class="main-content">
      <HeroSection id="home" />
      <AboutSection id="about" />
      <SkillsSection id="skills" />
      <ProjectsSection id="projects" />
      <ExperienceSection id="experience" />
      <ContactSection id="contact" />
    </main>

    <AppFooter />
    
    <t-back-top 
      :visible-height="300" 
      class="back-to-top"
    />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import AppHeader from './AppHeader.vue'
import AppFooter from './AppFooter.vue'
import HeroSection from './HeroSection.vue'
import AboutSection from './AboutSection.vue'
import SkillsSection from './SkillsSection.vue'
import ProjectsSection from './ProjectsSection.vue'
import ExperienceSection from './ExperienceSection.vue'
import ContactSection from './ContactSection.vue'

const activeMenu = ref('home')

const handleMenuChange = (value) => {
  activeMenu.value = value
}
</script>

<style scoped>
.app-container {
  min-height: 100vh;
  position: relative;
}

.back-to-top {
  z-index: 1000;
}
</style>
