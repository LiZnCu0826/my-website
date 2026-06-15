<template>
  <section id="contact" class="section contact-section">
    <div class="section-wrapper">
      <div class="section-header">
        <h2 class="section-title">联系我</h2>
        <p class="section-subtitle">如果你对我的作品感兴趣，欢迎随时联系</p>
      </div>

      <div class="contact-content">
        <!-- 左侧联系信息 -->
        <div class="contact-info">
          <div class="info-cards">
            <div v-for="item in contactInfo" :key="item.label" class="info-card-item card-hover">
              <t-icon :name="item.icon" size="28px" class="info-icon" />
              <div class="info-body">
                <span class="info-card-label">{{ item.label }}</span>
                <span class="info-card-value">{{ item.value }}</span>
              </div>
            </div>
          </div>

        </div>

        <!-- 右侧留言表单 -->
        <div class="contact-form-wrapper card-hover">
          <t-card :bordered="false" class="contact-form-card">
            <template #header>
              <h3 class="form-title">给我留言</h3>
            </template>
            <t-form
              :data="formData"
              label-width="0"
              class="contact-form"
            >
              <t-form-item>
                <t-input
                  v-model="formData.name"
                  placeholder="你的名字"
                  clearable
                >
                  <template #prefix-icon>
                    <t-icon name="user" />
                  </template>
                </t-input>
              </t-form-item>
              <t-form-item>
                <t-input
                  v-model="formData.email"
                  placeholder="你的邮箱"
                  clearable
                >
                  <template #prefix-icon>
                    <t-icon name="mail" />
                  </template>
                </t-input>
              </t-form-item>
              <t-form-item>
                <t-textarea
                  v-model="formData.message"
                  placeholder="写下你想说的话..."
                  :autosize="{ minRows: 4, maxRows: 8 }"
                />
              </t-form-item>
              <t-form-item>
                <t-button theme="primary" block size="large" :loading="submitting" @click="handleSubmit">
                  {{ submitting ? '发送中...' : '发送消息' }}
                </t-button>
              </t-form-item>
            </t-form>
          </t-card>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { MessagePlugin } from 'tdesign-vue-next'

const formData = ref({
  name: '',
  email: '',
  message: '',
})

const submitting = ref(false)

// 🔧 替换为你的 Formspree 表单 ID（免费注册 https://formspree.io 获取）
const FORMSPREE_ID = 'YOUR_FORM_ID'

const contactInfo = [
  { icon: 'mail', label: '邮箱', value: '2553083632@qq.com' },
  { icon: 'call', label: '电话', value: '18909919365' },
  { icon: 'logo-wechat-stroke', label: '微信', value: 'lxt17799194170' },
]

const handleSubmit = async () => {
  if (!formData.value.name || !formData.value.email || !formData.value.message) {
    MessagePlugin.warning('请填写完整信息')
    return
  }
  submitting.value = true
  try {
    const res = await fetch(`https://formspree.io/f/${FORMSPREE_ID}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        name: formData.value.name,
        email: formData.value.email,
        message: formData.value.message,
      }),
    })
    if (res.ok) {
      MessagePlugin.success('消息已发送，感谢你的留言！')
      formData.value = { name: '', email: '', message: '' }
    } else {
      throw new Error('发送失败')
    }
  } catch {
    MessagePlugin.error('发送失败，请稍后重试或直接通过邮箱联系')
  } finally {
    submitting.value = false
  }
}
</script>

<style scoped>
.contact-section {
  background: var(--bg-section-alt);
}

.contact-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
  align-items: start;
}

.info-cards {
  display: flex;
  flex-direction: column;
  gap: 16px;
  margin-bottom: 32px;
}

.info-card-item {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 20px;
  background: var(--card-bg);
  border: 1px solid var(--border-color);
  border-radius: 12px;
  box-shadow: var(--card-shadow);
}

.info-icon {
  color: var(--primary-color);
  flex-shrink: 0;
}

.info-body {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.info-card-label {
  color: var(--text-muted);
  font-size: 0.85rem;
}

.info-card-value {
  color: var(--text-primary);
  font-size: 0.95rem;
  font-weight: 500;
}

.contact-form-card {
  background: var(--card-bg) !important;
  border: 1px solid var(--border-color) !important;
  border-radius: 12px !important;
  box-shadow: var(--card-shadow) !important;
}

.form-title {
  color: var(--text-primary);
  font-size: 1.1rem;
}

.contact-form {
  margin-top: 8px;
}

@media (max-width: 768px) {
  .contact-content {
    grid-template-columns: 1fr;
    gap: 32px;
  }
}
</style>
