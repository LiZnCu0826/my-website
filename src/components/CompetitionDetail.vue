<template>
  <div class="detail-page">
    <!-- 顶部操作栏 -->
    <div class="top-actions">
      <a class="back-link" @click="goBack">
        <t-icon name="chevron-left" size="20px" /> 返回主页
      </a>
    </div>

    <h1 class="doc-title">策划也疯狂 — 参赛作品说明</h1>

    <div class="doc-meta">
      <t-tag theme="primary" variant="light">赛事：网易高校 MINI GAME 挑战赛</t-tag>
      <t-tag theme="success" variant="light">类型：轻策略模拟游戏</t-tag>
      <t-tag theme="warning" variant="light">题材：游戏运营策划职场模拟</t-tag>
    </div>

    <p class="doc-subtitle">一款关于运营策划职场的压力取舍模拟器</p>

    <!-- 游戏展示区 -->
    <section class="game-showcase">
      <div class="game-cover">
        <img src="/crazy-planner-cover.png" alt="策划也疯狂" />
      </div>
      <div class="game-info">
        <h2>🎮 参赛作品：《策划也疯狂》</h2>
        <p>一款以游戏运营策划为题材的轻策略卡牌模拟游戏，使用 Godot 引擎开发。在 7 天考核期内，从随机卡牌中选择运营方案，管理 KPI 和团队压力，追求最佳评级。</p>
        <div class="game-meta">
          <span><t-icon name="tools" size="16px" /> 开发引擎：Godot</span>
          <span><t-icon name="layers" size="16px" /> 卡牌数量：23 张</span>
          <span><t-icon name="time" size="16px" /> 单局时长：3-5 分钟</span>
        </div>
        <div class="game-download">
          <a :href="downloadUrl" download class="download-btn">
            <t-button theme="primary" size="large">
              <t-icon name="download" size="18px" /> 下载游戏文件 (ZIP)
            </t-button>
          </a>
          <span class="download-hint">下载解压后用 Godot 引擎打开即可运行</span>
        </div>
      </div>
    </section>

    <section class="doc-section">
      <h2>一、游戏简介</h2>
      <p>《策划也疯狂》是一款以游戏运营策划为题材的轻策略模拟游戏。你将扮演一名初入行的游戏运营策划，在 7 天的考核期内，每天从随机抽取的 10 张运营方案卡牌中选择 5 张执行，努力达成 KPI 目标，同时管理团队压力，避免被老板辞退。</p>
      <p>游戏共包含 23 张不同等级、不同效果的运营卡牌，每局随机出现，体验各不相同。</p>
    </section>

    <section class="doc-section">
      <h2>二、制作理念</h2>

      <div class="feature-card">
        <div class="feature-num">1</div>
        <div class="feature-body">
          <h3>核心设计：舍与得的乐趣</h3>
          <p>市面上很多模拟经营游戏追求"全都要"的爽感，但真实的职场运营更像一场取舍游戏——资源有限、时间有限、每个选择都有代价。我们希望玩家体验到"没有完美决策，只有最适合当下的权衡"的核心乐趣。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">2</div>
        <div class="feature-body">
          <h3>卡牌系统：用策略叙事取代数值堆砌</h3>
          <p>每张卡牌对应一个真实的运营手段：广告投放、社交裂变、数据调优、IP 联动……卡牌不是冰冷的数值加减，而是一个"决策故事"。玩家通过组合不同的卡牌来应对不同的 KPI 挑战，每个决策都能在满意度变化和社区反馈中看到直接结果。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">3</div>
        <div class="feature-body">
          <h3>三颗星机制：降低挫败感，保留挑战感</h3>
          <p>每天三个 KPI（流水、留存、好评），每达标一项获得一颗星。你不必面面俱到——即使某天只拿到 1 颗星，游戏仍能继续，只是最终评级会受影响。这种设计让新手不至于卡死，也让高手有追求完美的空间。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">4</div>
        <div class="feature-body">
          <h3>视觉风格</h3>
          <p>游戏采用商务办公风的实景背景与便签纸风格的弹窗 UI，配合分级卡牌色彩系统（白→绿→蓝→金→红），营造一种"在工位上认真工作"的代入感。</p>
        </div>
      </div>
    </section>

    <section class="doc-section">
      <h2>三、操作指南</h2>
      <h3>游戏流程</h3>
      <p>开始游戏 → 查看当日 KPI → 从 10 张卡牌中选 5 张放入卡槽 → 点击"结束今天"结算 → 查看 KPI 达成情况 → 进入下一天 → 继续选择 → 7天后或压力满100 → 游戏结束</p>

      <h3>详细步骤</h3>
      <div class="feature-card">
        <div class="feature-num">1</div>
        <div class="feature-body">
          <h3>主菜单</h3>
          <p>点击「开始运营」进入游戏，弹窗显示当天的 KPI 任务和达标要求。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">2</div>
        <div class="feature-body">
          <h3>选择运营方案</h3>
          <p>左侧「运营操作」面板列出当日可用的 10 张卡牌。每张卡牌显示名称、描述、费用、等级、效果。点击卡牌将其添加到下方的卡槽（最多 5 张），点击已选的卡槽可将卡牌放回重新选择。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">3</div>
        <div class="feature-body">
          <h3>结算</h3>
          <p>选满 5 张卡后，点击「结束今天」，系统依次执行 5 张卡牌，更新各项数值。查看当天的 KPI 达成情况（获得星星表示达标）。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">4</div>
        <div class="feature-body">
          <h3>循环</h3>
          <p>点击「进入下一天 →」继续。每天可用的卡牌池会重新随机抽取。部分卡牌有冷却 CD，使用后需等待。</p>
        </div>
      </div>

      <h3>需要注意</h3>
      <ul class="config-list">
        <li><strong>团队压力：</strong>若单日 KPI 未达标（少于 2 星），压力值增加。压力达到 100 直接 Game Over。</li>
        <li><strong>卡牌冷却：</strong>某些强力卡牌使用后需要冷却数个回合才能再次使用。</li>
        <li><strong>等级系统：</strong>卡牌分 5 个等级（基础→优秀→稀有→史诗→传说），等级越高效果越强，代价也越大。</li>
        <li><strong>合理取舍：</strong>不可能讨好所有玩家群体，有时候必须牺牲某一群体来保 KPI。</li>
      </ul>
    </section>

    <section class="doc-section">
      <h2>四、最终评级</h2>
      <div class="rating-table">
        <div class="rating-row rating-header">
          <span>总星数</span>
          <span>称号</span>
          <span>评价</span>
        </div>
        <div class="rating-row">
          <span>0～6 星</span>
          <span>试用期未过</span>
          <span>被辞退</span>
        </div>
        <div class="rating-row">
          <span>7～13 星</span>
          <span>实习策划</span>
          <span>勉强通过</span>
        </div>
        <div class="rating-row">
          <span>14～17 星</span>
          <span>正式策划</span>
          <span>表现良好</span>
        </div>
        <div class="rating-row rating-best">
          <span>18～21 星</span>
          <span>天才策划</span>
          <span>完美通关</span>
        </div>
      </div>
      <p class="note-text">每天最多 3 星 × 7 天 = 最多 21 星（可能性极小）。祝你好运！</p>
      <blockquote class="quote">「没有人能讨好所有人，你只能选择让谁满意，让谁离开。」</blockquote>
    </section>

    <section class="doc-section">
      <h2>五、设计概要</h2>

      <h3>用户与市场情况</h3>
      <div class="feature-card">
        <div class="feature-num"><t-icon name="user" size="18px" /></div>
        <div class="feature-body">
          <h3>目标用户</h3>
          <p>核心用户：20-35 岁，有职场经验的游戏玩家，尤其在互联网/游戏行业工作的从业者。泛用户：喜欢轻策略模拟类游戏的玩家。边缘用户：对"职场""运营""KPI"话题有共鸣的泛游戏用户。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num"><t-icon name="lightbulb" size="18px" /></div>
        <div class="feature-body">
          <h3>用户痛点</h3>
          <p>① 职场代入感：大量玩家对「运营策划」「KPI 压力」「讨好各方」等题材有切身感受。② 短平快需求：一局 3-5 分钟，适合碎片时间。③ 多结局驱动：不同决策带来不同结局，重玩性强。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num"><t-icon name="chart-bar" size="18px" /></div>
        <div class="feature-body">
          <h3>市场定位</h3>
          <p><strong>竞品分析：</strong>市面上缺少以「游戏运营策划」为题材的模拟游戏。同类职场模拟多偏向「创业开店」「经营公司」等大叙事，缺少聚焦「打工人日常取舍」的轻量产品。</p>
          <p><strong>差异化：</strong>以「卡牌选择」替代传统的数值堆叠模拟，降低上手门槛，保留策略深度。</p>
        </div>
      </div>
    </section>

    <section class="doc-section">
      <h2>六、核心乐趣</h2>
      <div class="feature-card">
        <div class="feature-num">1</div>
        <div class="feature-body">
          <h3>取舍的博弈</h3>
          <p>每一个选择都有代价，没有完美方案。面对互相矛盾的需求（流水 vs 好评、硬核玩家 vs 休闲玩家），做出"有限资源下的最优解"。</p>
        </div>
      </div>
      <div class="feature-card">
        <div class="feature-num">2</div>
        <div class="feature-body">
          <h3>随机性带来的意外感</h3>
          <p>每天 10 张随机卡牌、冷却系统、不同 KPI 组合……没有两局完全相同。在"不完美的手牌"中即兴发挥。</p>
        </div>
      </div>
      <div class="feature-card">
        <div class="feature-num">3</div>
        <div class="feature-body">
          <h3>追求完美的动力</h3>
          <p>三颗星机制（21 星满）让玩家有清晰的进度感和目标感。从"实习策划"到"天才策划"的晋升之路提供了充足的重复游玩动力。</p>
        </div>
      </div>
    </section>

    <section class="doc-section">
      <h2>七、核心体验</h2>
      <blockquote class="quote">「在工位上，面对老板的 KPI、玩家的骂声和有限的资源，你只能选择——让谁满意，让谁离开。」</blockquote>

      <div class="experience-table">
        <div class="exp-row exp-header">
          <span>阶段</span>
          <span>情绪</span>
          <span>体验</span>
        </div>
        <div class="exp-row">
          <span>Day 1</span>
          <span>😊 轻松</span>
          <span>简单 KPI，基础卡牌，感觉游刃有余</span>
        </div>
        <div class="exp-row">
          <span>Day 3</span>
          <span>😰 紧张</span>
          <span>KPI 要求上升，高等级卡牌出现，开始面临取舍</span>
        </div>
        <div class="exp-row">
          <span>Day 5</span>
          <span>😱 焦虑</span>
          <span>压力累积，卡牌冷却中，必须做出艰难决定</span>
        </div>
        <div class="exp-row">
          <span>Day 7</span>
          <span>😌 释然/不甘</span>
          <span>最终结算，看到自己的评级和评语</span>
        </div>
      </div>

      <h3 style="margin-top: 24px;">情绪曲线设计</h3>
      <p>每局内部：开局轻松 → 中期紧张 → 后期高压 → 结算释放</p>
      <p>多局之间：第一次"试试水" → 第二次"再努力一点" → 第三次"我要冲天才"</p>

      <h3 style="margin-top: 24px;">操作手感</h3>
      <ul class="config-list">
        <li><strong>点击卡牌 → 放入卡槽：</strong>即时反馈，拖拽选中感强</li>
        <li><strong>点击卡槽 → 放回卡牌：</strong>允许反悔，降低决策压力</li>
        <li><strong>点击结算 → 逐张执行：</strong>过程可视化，每张卡效果依次呈现</li>
        <li><strong>UI 响应流畅：</strong>减少等待感，保证操作节奏</li>
      </ul>
    </section>

    <section class="doc-section">
      <h2>八、题材表达</h2>
      <blockquote class="quote">「做游戏策划就像在暴风雨中掌舵——你不可能让所有乘客都满意，只能保证船不沉。」</blockquote>

      <h3>核心隐喻</h3>
      <p>整个游戏以「运营策划」这个职业为载体，通过卡牌机制来抽象表达现实职场中的核心矛盾：玩家在游戏中经历的每一次取舍，都是真实职场中"资源有限、各方利益冲突"的缩影。</p>

      <h3>矛盾映射</h3>
      <div class="mapping-table">
        <div class="map-row map-header">
          <span>游戏机制</span>
          <span>现实映射</span>
        </div>
        <div class="map-row"><span>四种玩家群体（硬核/白嫖/休闲/氪金）</span><span>现实中的多利益相关方</span></div>
        <div class="map-row"><span>每张卡的副作用（满意度-流水矛盾）</span><span>职场的"没有免费的午餐"</span></div>
        <div class="map-row"><span>冷却系统</span><span>资源/人力/时间的限制</span></div>
        <div class="map-row"><span>团队压力值（超过 100 被辞退）</span><span>职场中的 burnout 和考核压力</span></div>
        <div class="map-row"><span>KPI 三颗星</span><span>现实中的绩效考核（不一定全达标，但要有亮点）</span></div>
        <div class="map-row"><span>最终评级（实习/正式/天才）</span><span>职级晋升体系</span></div>
      </div>

      <h3 style="margin-top: 24px;">视觉风格加分</h3>
      <ul class="config-list">
        <li><strong>办公场景背景：</strong>强化"打工人"代入感</li>
        <li><strong>便签纸弹窗：</strong>模拟真实工位上的便签/文档</li>
        <li><strong>分级卡牌色彩：</strong>让策略选择有直观的"品质感"</li>
        <li><strong>整体色调：</strong>冷静克制，避免花哨，契合职场题材</li>
      </ul>

      <div class="highlight-box">
        <p>游戏不仅是一个策略模拟器，更是对游戏行业运营岗位的一次<strong>温情与自嘲并存</strong>的侧写。玩家在游戏中经历的"讨好所有人却得罪所有人"正是现实中许多游戏运营的真实日常——这种共鸣是产品最大的情感护城河。</p>
        <p class="ending-quote">「策划也疯狂，其实每个游戏爱好者心里都有一个策划。」</p>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const downloadUrl = ref('/crazy-planner-game.zip')

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
  margin-bottom: 12px;
  line-height: 1.4;
}

.doc-subtitle {
  font-size: 1.1rem;
  color: var(--text-secondary);
  font-style: italic;
  margin-bottom: 32px;
}

/* 游戏展示区 */
.game-showcase {
  display: flex;
  gap: 32px;
  padding: 28px;
  background: var(--bg-section);
  border: 1px solid var(--border-color);
  border-radius: 16px;
  margin-bottom: 40px;
  align-items: center;
}

.game-cover {
  flex-shrink: 0;
  width: 240px;
  height: 240px;
  border-radius: 12px;
  overflow: hidden;
  background: var(--primary-extra-light);
}

.game-cover img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.game-info {
  flex: 1;
}

.game-info h2 {
  font-size: 1.25rem;
  color: var(--text-primary);
  margin-bottom: 12px;
}

.game-info p {
  color: var(--text-secondary);
  font-size: 0.93rem;
  line-height: 1.8;
  margin-bottom: 16px;
}

.game-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  margin-bottom: 20px;
}

.game-meta span {
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: 0.85rem;
  color: var(--text-muted);
}

.game-meta span .t-icon {
  color: var(--primary-color);
}

.game-download {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.download-btn {
  text-decoration: none;
  display: inline-block;
}

.download-hint {
  font-size: 0.8rem;
  color: var(--text-muted);
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

.doc-section h3 {
  font-size: 1.05rem;
  color: var(--text-primary);
  margin-bottom: 12px;
  margin-top: 20px;
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
  margin-top: 0;
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

.rating-table {
  border-radius: 10px;
  overflow: hidden;
  border: 1px solid var(--border-color);
  margin-bottom: 16px;
}

.rating-row {
  display: flex;
  padding: 12px 20px;
  border-bottom: 1px solid var(--border-color);
  background: var(--bg-section);
}

.rating-row:last-child {
  border-bottom: none;
}

.rating-row:hover {
  background: var(--primary-extra-light);
}

.rating-header {
  background: var(--gradient-primary);
  color: #fff;
  font-weight: 700;
  font-size: 0.95rem;
}

.rating-row span {
  flex: 1;
  font-size: 0.92rem;
  color: var(--text-secondary);
}

.rating-header span {
  color: #fff;
}

.rating-best span {
  color: var(--primary-color);
  font-weight: 600;
}

.note-text {
  font-size: 0.9rem;
  color: var(--text-muted);
  font-style: italic;
}

.quote {
  border-left: 4px solid var(--primary-color);
  padding: 16px 20px;
  margin: 16px 0;
  background: var(--primary-extra-light);
  border-radius: 0 8px 8px 0;
  font-style: italic;
  color: var(--text-secondary);
  line-height: 1.8;
}

.experience-table {
  border-radius: 10px;
  overflow: hidden;
  border: 1px solid var(--border-color);
  margin-top: 16px;
}

.exp-row {
  display: flex;
  padding: 12px 20px;
  border-bottom: 1px solid var(--border-color);
  background: var(--bg-section);
}

.exp-row:last-child {
  border-bottom: none;
}

.exp-row:hover {
  background: var(--primary-extra-light);
}

.exp-header {
  background: var(--gradient-primary);
  color: #fff;
  font-weight: 700;
  font-size: 0.95rem;
}

.exp-row span {
  flex: 1;
  font-size: 0.92rem;
  color: var(--text-secondary);
}

.exp-header span {
  color: #fff;
}

.mapping-table {
  border-radius: 10px;
  overflow: hidden;
  border: 1px solid var(--border-color);
  margin-top: 12px;
}

.map-row {
  display: flex;
  padding: 12px 20px;
  border-bottom: 1px solid var(--border-color);
  background: var(--bg-section);
}

.map-row:last-child {
  border-bottom: none;
}

.map-row:hover {
  background: var(--primary-extra-light);
}

.map-header {
  background: var(--gradient-primary);
  color: #fff;
  font-weight: 700;
  font-size: 0.95rem;
}

.map-row span {
  flex: 1;
  font-size: 0.9rem;
  color: var(--text-secondary);
}

.map-header span {
  color: #fff;
}

.highlight-box {
  background: var(--primary-extra-light);
  border: 1px solid rgba(21, 101, 192, 0.15);
  border-radius: 12px;
  padding: 28px 24px;
  margin-top: 24px;
}

.highlight-box p {
  color: var(--text-primary);
  line-height: 1.9;
}

.ending-quote {
  text-align: right;
  font-style: italic;
  margin-top: 16px;
  color: var(--primary-color);
  font-weight: 500;
}

@media (max-width: 768px) {
  .top-actions {
    flex-direction: column;
    gap: 12px;
    align-items: flex-start;
  }

  .game-showcase {
    flex-direction: column;
    padding: 20px;
  }

  .game-cover {
    width: 100%;
    height: 200px;
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

  .rating-row span,
  .exp-row span,
  .map-row span {
    font-size: 0.82rem;
  }
}
</style>
