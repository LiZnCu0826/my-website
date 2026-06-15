<template>
  <div class="detail-page">
    <div class="top-actions">
      <a class="back-link" @click="goBack">
        <t-icon name="chevron-left" size="20px" /> 返回主页
      </a>
    </div>

    <h1 class="doc-title">物理AI概念提案——AI自动挪车/泊车</h1>

    <div class="doc-meta">
      <t-tag theme="primary" variant="light">赛事：小鹏 AI 公开赛</t-tag>
      <t-tag theme="success" variant="light">类型：物理AI概念提案</t-tag>
      <t-tag theme="warning" variant="light">领域：智能出行·科技平权</t-tag>
    </div>

    <p class="doc-subtitle">物理AI·脑洞大开 —— 让老旧小区告别"挪车焦虑"</p>

    <section class="doc-section">
      <h2>一、痛点洞察 | The Problem</h2>
      <p>当前国内多数老旧小区、高密度刚需小区普遍存在车位配比不足、停车空间狭窄、车位规划无序的核心问题，车辆保有量远大于固定车位数量，小区内部道路、闲置空地、楼道口成为业主临时停车的主要区域，常态化出现车辆占道、挡车、互相封堵的停车乱象，衍生大量民生痛点与矛盾纠纷。</p>

      <div class="feature-card">
        <div class="feature-num">1</div>
        <div class="feature-body">
          <h3>临时停车刚需与出行效率严重冲突</h3>
          <p>车位紧张场景下，业主归家无固定车位，只能临时停靠在主干道、他人车位出入口、消防通道边缘等临界位置，极易遮挡其他业主车辆出行、阻碍小区通行。一旦被堵，车主必须收到挪车通知后，亲自下楼操作挪车，无论深夜休息、雨天酷暑、居家办公、深夜熟睡，都需中断当前状态奔赴现场，单次挪车耗时数分钟至十几分钟，高频次、无规律的挪车行为严重消耗业主时间与精力，极大降低居住幸福感与出行效率。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">2</div>
        <div class="feature-body">
          <h3>人工挪车沟通成本高、矛盾频发</h3>
          <p>传统挪车依赖电话、微信、物业转告等方式，存在通知延迟、车主失联、沟通扯皮等问题。被堵车主焦急等待、挪车车主被动奔波，极易引发邻里争执、投诉纠纷，甚至出现车辆剐蹭、恶意堵停、过激维权等冲突，成为小区邻里矛盾、物业投诉的核心高发场景，增加社区治理压力。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">3</div>
        <div class="feature-body">
          <h3>传统解决方案存在明显短板</h3>
          <p>目前小区主流解决方式仅为人工呼叫挪车、保安人工疏导挪车、改造立体车位，均无法根治痛点：人工挪车效率极低、人力成本高且无法全天候值守；车位改造投入大、周期长，多数老旧小区受场地、基建限制无法落地；常规一键挪车系统仅能实现消息提醒，无法解决"必须人工到场挪车"的核心难题，治标不治本。整体来看，行业始终缺少一套无需人工到场、自主完成挪车泊车的轻量化智能解决方案。</p>
        </div>
      </div>
    </section>

    <section class="doc-section">
      <h2>二、AI破解之道 | The AI Solution</h2>
      <p>本方案依托物理AI技术，融合环境感知、智能决策、自主运动控制、实时云端联动能力，打造适配老旧小区、高密度车位紧张小区的全自动AI挪车/泊车系统，无需车主到场、无需人工干预，实现临时占位车辆智能避让、自主归位、精准泊车，彻底解决人工挪车的繁琐痛点，适配小区"华容道式"复杂停车场景。</p>

      <div class="highlight-box" style="margin-bottom: 20px;">
        <p><strong>核心技术原理：物理AI全域自主适配</strong></p>
        <p>区别于传统依赖规整车位、固定路线的自动泊车，本系统主打无固定车位适配、动态环境自适应。通过车载物理AI感知模块+小区全域监控AI联动，实时扫描小区道路、车辆停放位置、通行空间、障碍物与人流动态，构建实时更新的三维停车环境模型，精准判断车辆封堵状态、可移动空间、安全行驶路线，实现复杂无序场景下的智能决策与自主挪车。</p>
      </div>

      <div class="feature-card">
        <div class="feature-num">1</div>
        <div class="feature-body">
          <h3>核心功能一：被动触发AI自动挪车</h3>
          <p>当车辆临时停靠封堵通行路口、他人车位，被堵业主发起挪车申请后，系统云端秒级推送指令至占位车辆AI终端。车辆无需车主启动，自主完成解锁、通电、环境复核，根据现场空间动态微调方向、低速平稳移动，避让出通行空间，挪车完成后自动驻车、锁车。全程AI自主控制，规避剐蹭、压线、占道等问题，真正实现"一键呼叫、无人挪车"。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">2</div>
        <div class="feature-body">
          <h3>核心功能二：主动预判AI智能泊车</h3>
          <p>针对小区车位紧张、临时停靠混乱问题，AI系统可主动预判停车需求。车主归家后可就近临时落车，系统自动扫描小区内闲置零碎空间、临时可停靠区域，结合周边车辆停放规律，自主规划最优泊车位置，将车辆平稳停放至不影响通行、不遮挡他人的安全区域，从源头减少占道堵车问题，盘活小区碎片化停车资源。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">3</div>
        <div class="feature-body">
          <h3>核心功能三：全域安全风控联动</h3>
          <p>搭载物理AI多重安全机制，挪车、泊车全程实时识别行人、非机动车、静态障碍物，遇突发动态立即紧急制动；联动小区物业云端系统，记录挪车轨迹、停放位置，实现全程可追溯。同时适配狭窄通道、弯道、零碎车位等老旧小区特殊场景，自适应调整车速、转向角度，杜绝人工挪车易出现的剐蹭、磕碰问题。</p>
        </div>
      </div>

      <blockquote class="quote">轻量化落地模式：无需大规模改造小区基建、无需铺设专用停车轨道，仅通过车载AI模块升级+小区云端智能联动即可落地，适配所有老旧小区、高密度小区，改造成本低、落地周期短、普适性极强。</blockquote>
    </section>

    <section class="doc-section">
      <h2>三、科技平权价值 | Tech for All</h2>

      <div class="feature-card">
        <div class="feature-num">1</div>
        <div class="feature-body">
          <h3>用户价值：解放人力，彻底告别被动挪车内耗</h3>
          <p>打破"停车难=挪车烦"的固有困境，彻底解决车主深夜、休息、工作时段被迫下楼挪车的繁琐问题，零人工参与、零时间消耗，大幅提升居民居住舒适度与出行效率。同时规避人工挪车沟通不畅、情绪对立引发的邻里矛盾，减少车主停车焦虑，让老旧小区停车从"抢位内卷、被动迁就"变为"智能适配、从容停车"，切实改善民生体验。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">2</div>
        <div class="feature-body">
          <h3>社区价值：降本增效，重塑小区停车秩序</h3>
          <p>大幅降低小区物业人工疏导、电话通知、纠纷调解的人力成本，替代传统保安人工挪车的低效模式，实现停车管理智能化、自动化。通过AI主动规整车辆停放，减少占道堵路、无序停车乱象，畅通小区通行与消防通道，提升小区安全管理水平，破解老旧小区长期存在的停车治理难题，降低社区基层治理压力。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">3</div>
        <div class="feature-body">
          <h3>行业价值：科技平权，普惠老旧小区改造</h3>
          <p>当前智能泊车技术多聚焦新建高端小区、规整车库，老旧小区长期被智能停车体系边缘化。本方案以轻量化、低成本、高适配的物理AI技术，填补老旧小区智能停车空白，无需大额基建投入即可享受高端智能泊车服务，实现科技不分新旧小区、智能普惠民生的平权理念。盘活老旧小区碎片化停车资源，最大化利用现有空间，以技术手段低成本破解城市老旧小区停车顽疾，为城市社区智慧化改造提供全新落地路径。</p>
        </div>
      </div>

      <div class="feature-card">
        <div class="feature-num">4</div>
        <div class="feature-body">
          <h3>社会价值：减少纠纷，提升城市治理温度</h3>
          <p>停车挪车纠纷是城市基层民生纠纷的高频场景，本方案从源头规避停车矛盾、车辆剐蹭纠纷，减少民事纠纷与维权事件，降低社会治理成本。以物理AI技术赋能基层民生，用智能化手段解决百姓高频痛点，让硬核科技落地日常民生场景，真正实现"科技服务生活、智能便利于民"。</p>
        </div>
      </div>
    </section>

    <div class="ending-box">
      <p>「科技不分新旧，智能普惠于民。」—— 让硬核AI技术落地日常民生场景，解决百姓真实痛点。</p>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()

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

.highlight-box {
  background: var(--primary-extra-light);
  border: 1px solid rgba(21, 101, 192, 0.15);
  border-radius: 12px;
  padding: 28px 24px;
}

.highlight-box p {
  color: var(--text-primary);
  line-height: 1.9;
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

.ending-box {
  background: var(--primary-extra-light);
  border: 1px solid rgba(21, 101, 192, 0.15);
  border-radius: 12px;
  padding: 32px 24px;
  text-align: center;
  margin-top: 40px;
}

.ending-box p {
  color: var(--primary-color);
  font-style: italic;
  font-weight: 500;
  font-size: 1.05rem;
  line-height: 1.8;
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
