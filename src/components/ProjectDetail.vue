<template>
  <div class="detail-page">
    <!-- 顶部操作栏 -->
    <div class="top-actions">
      <a class="back-link" @click="goBack">
        <t-icon name="chevron-left" size="20px" /> 返回主页
      </a>
      <a :href="demoUrl" target="_blank">
        <t-button theme="primary" size="medium">
          在线体验 Demo →
        </t-button>
      </a>
    </div>

    <h1 class="doc-title">「未来鹅」腾讯学生成长陪伴计划 — 方案说明</h1>

    <div class="doc-meta">
      <t-tag theme="primary" variant="light">项目名称：未来鹅（FuturePenguin）</t-tag>
      <t-tag theme="default" variant="light">技术栈：纯前端单文件 HTML + CSS + JavaScript</t-tag>
      <t-tag theme="success" variant="light">部署方式：Codebuddy + 腾讯云 CloudBase 静态托管</t-tag>
    </div>

    <section class="doc-section">
      <h2>一、问题诊断</h2>
      <p>腾讯校招生态面临一个核心痛点：对大一、大二等低年级学生缺乏"一对一陪伴式"的长期链接。现有平台（如 join.qq.com）偏重岗位投递，面向已有明确求职意向的毕业年级学生，而占学生群体 60%+ 的低年级人群缺少渐进式引导，导致腾讯在人才漏斗最上游的触达率不足。具体表现为：</p>
      <p>① 缺少按年级分层的差异化指导；</p>
      <p>② 学生无法持续感知腾讯各事业群方向；</p>
      <p>③ 无"专属学长"陪伴感，品牌情感链接薄弱。</p>
    </section>

    <section class="doc-section">
      <h2>二、方案设计</h2>
      <p>「未来鹅」定位为腾讯学生成长陪伴产品，以"鹅学长"AI 角色为核心，围绕年级路线图、任务系统、BG 匹配、模拟面试四大功能模块，提供从大一到大四的全周期陪伴体验。核心设计如下：</p>

      <div class="feature-card">
        <div class="feature-num">1</div>
        <div class="feature-body">
          <h3>年级路线图</h3>
          <p>按学期拆分（上/下），区分主线🔴与支线🔵任务，覆盖大一至大四 8 个学期，每学期 2 主线 + 2 支线，任务粒度可勾选追踪。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">2</div>
        <div class="feature-body">
          <h3>任务系统</h3>
          <p>支持勾选完成、自定义"⭐加分项"、阶段升级（大一→大二），未完成任务自动结转至下一阶段，进度持久化于 localStorage。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">3</div>
        <div class="feature-body">
          <h3>BG 匹配</h3>
          <p>基于专业关键词 + 学校层次 + 用户选择三维度计算匹配度，Top3 方向以环形进度图 + 柱状图可视化呈现。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">4</div>
        <div class="feature-body">
          <h3>AI 陪伴</h3>
          <p>"鹅学长"角色贯穿全程——欢迎页开场白、路线图推荐、聊天快捷问答，⭐鹅学长推荐任务标注 CodeBuddy / WorkBuddy 工具使用。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">5</div>
        <div class="feature-body">
          <h3>暖橙色视觉 + 企鹅吉祥物</h3>
          <p>暖橙主题色（#FF6B1A）、3D 企鹅 IP 形象、"有鹅选鹅"SVG 水印，品牌调性鲜明且温暖亲切。</p>
        </div>
      </div>
    </section>

    <section class="doc-section">
      <h2>三、AI 工具选型</h2>
      <p>Workbuddy ＋ 腾讯校园招聘技能 ＋ 专家团队（软件开发团队）</p>
      <p>CodeBuddy 调用 CloudBase 部署</p>
    </section>

    <section class="doc-section">
      <h2>四、关键配置</h2>
      <ul class="config-list">
        <li><strong>技术架构：</strong>单 HTML 文件（~330KB），内嵌 CSS + JS，零依赖，浏览器直接运行。</li>
        <li><strong>数据持久化：</strong>localStorage，版本化 key（ROADMAP_DATA_VERSION=2），含用户档案 / 任务进度 / 聊天记录 / 遗留任务四类数据。</li>
        <li><strong>部署：</strong>通过 Codebuddy 集成的腾讯云 CloudBase 静态网站托管服务一键部署，CloudBase 自动处理 Content-Type、CDN 加速与 HTTPS 证书。</li>
        <li><strong>跨年升级：</strong>GRADE_ORDER=[freshman,sophomore,junior,senior]，升级时收集未完成任务存入 CARRYOVER_KEY，跨阶段可勾选完成。</li>
      </ul>
    </section>

    <section class="doc-section">
      <h2>五、迭代记录与效果评估</h2>
      <div class="iteration-list">
        <div class="iter-item"><span class="iter-ver">V1</span><span class="iter-date">6/12</span>基础框架搭建——年级选择 + 路线图 + 岗位探索 + AI 对话。</div>
        <div class="iter-item"><span class="iter-ver">V2</span><span class="iter-date">6/12</span>增强版——学校/专业输入、多方向路线图、资源推荐、匹配度分析。</div>
        <div class="iter-item"><span class="iter-ver">V3</span><span class="iter-date">6/13</span>产品重塑——"未来鹅"品牌定位、鹅学长角色、腾讯 BG 体系、学期制路线图。</div>
        <div class="iter-item"><span class="iter-ver">V4</span><span class="iter-date">6/13</span>任务系统——可勾选任务 + 自定义加分项 + 进度条 + localStorage 持久化。</div>
        <div class="iter-item"><span class="iter-ver">V5</span><span class="iter-date">6/14</span>Bug 修复——版本化 localStorage 解决任务状态错位；本地记忆（昵称+聊天记录+回访恢复）。</div>
        <div class="iter-item"><span class="iter-ver">V6</span><span class="iter-date">6/14</span>视觉升级——暖橙主题 + AI 企鹅吉祥物 + 去背景处理 + SVG 水印。</div>
        <div class="iter-item"><span class="iter-ver">V7</span><span class="iter-date">6/14</span>功能完善——阶段升级 + 遗留任务结转 + ⭐鹅学长推荐标记。</div>
        <div class="iter-item"><span class="iter-ver">V8</span><span class="iter-date">6/14</span>部署上线——通过 Codebuddy 调用 CloudBase 一键部署至腾讯云，自动完成静态托管配置与 CDN 分发，公网即刻可访问。</div>
      </div>
    </section>

    <section class="doc-section highlight-box">
      <h2>效果评估总结</h2>
      <p>从 V1 的通用职业工具到 V8 的腾讯专属陪伴产品，经历了品牌重塑、交互深化、视觉升级三次关键转向。全程借助 Codebuddy 完成代码编写，DALL·E 生成视觉素材，Python BFS 脚本处理图像，CloudBase 一键部署，形成"需求描述→AI 生成→即时部署"的完整 AI-Native 开发闭环。最终产品实现了"年级分层引导 + BG 匹配推荐 + AI 工具赋能 + 情感化陪伴"四维一体，覆盖大一至大四全周期，且单文件零依赖架构确保了极低部署成本与高可移植性。</p>
    </section>

  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()
const demoUrl = 'https://aaa-d8gu7fi38e2be9736-1438511117.tcloudbaseapp.com/'

const goBack = () => {
  router.push('/')
}
</script>

<style scoped>
.detail-page {
  max-width: 900px;
  margin: 0 auto;
  padding: 40px 24px 80px;
}

.top-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 32px;
  padding-bottom: 20px;
  border-bottom: 2px solid var(--primary-extra-light);
}

.back-link {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  color: var(--primary-color);
  font-size: 0.95rem;
  cursor: pointer;
  font-weight: 500;
  user-select: none;
}

.back-link:hover {
  opacity: 0.75;
}

.doc-title {
  font-size: 2rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 20px;
  line-height: 1.4;
}

.doc-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 40px;
  padding-bottom: 24px;
  border-bottom: 2px solid var(--primary-extra-light);
}

.doc-section {
  margin-bottom: 36px;
}

.doc-section h2 {
  font-size: 1.3rem;
  color: var(--primary-color);
  margin-bottom: 16px;
  padding-left: 14px;
  border-left: 4px solid var(--primary-color);
}

.doc-section p {
  color: var(--text-secondary);
  line-height: 1.9;
  margin-bottom: 10px;
  font-size: 0.95rem;
}

.feature-card {
  display: flex;
  gap: 16px;
  padding: 20px;
  margin-bottom: 14px;
  background: var(--bg-section);
  border-radius: 10px;
  border: 1px solid var(--border-color);
}

.feature-num {
  flex-shrink: 0;
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: var(--gradient-primary);
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: 1rem;
}

.feature-body h3 {
  font-size: 1.05rem;
  color: var(--text-primary);
  margin-bottom: 6px;
}

.feature-body p {
  color: var(--text-secondary);
  font-size: 0.92rem;
  line-height: 1.7;
  margin: 0;
}

.config-list {
  list-style: none;
  padding: 0;
}

.config-list li {
  padding: 12px 16px;
  margin-bottom: 8px;
  background: var(--bg-section);
  border-radius: 8px;
  color: var(--text-secondary);
  font-size: 0.92rem;
  line-height: 1.7;
  border: 1px solid var(--border-color);
}

.config-list li strong {
  color: var(--text-primary);
}

.iteration-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.iter-item {
  font-size: 0.93rem;
  color: var(--text-secondary);
  line-height: 1.7;
  padding: 10px 14px;
  background: var(--bg-section);
  border-radius: 8px;
  border: 1px solid var(--border-color);
}

.iter-ver {
  display: inline-block;
  background: var(--gradient-primary);
  color: #fff;
  font-size: 0.75rem;
  font-weight: 700;
  padding: 2px 8px;
  border-radius: 4px;
  margin-right: 6px;
}

.iter-date {
  color: var(--text-muted);
  font-size: 0.82rem;
  margin-right: 10px;
}

.highlight-box {
  background: var(--primary-extra-light);
  border: 1px solid rgba(21, 101, 192, 0.15);
  border-radius: 12px;
  padding: 28px 24px;
  margin-top: 40px;
}

.highlight-box h2 {
  border-color: var(--primary-color);
}

.highlight-box h2 {
  border-color: var(--primary-color);
}

@media (max-width: 768px) {
  .top-actions {
    flex-direction: column;
    gap: 12px;
    align-items: flex-start;
  }

  .doc-title {
    font-size: 1.5rem;
  }

  .doc-meta {
    flex-direction: column;
  }

  .feature-card {
    flex-direction: column;
    gap: 10px;
  }
}
</style>
