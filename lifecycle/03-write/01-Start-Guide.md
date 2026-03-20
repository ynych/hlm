# 癸酉续红 · 多Agent协作启动指南

## 项目结构总览

```
guixu-redream/
├── README.md                    # 项目说明
├── PROJECT.md                   # 进度规划
├── STYLE_GUIDE.md              # 文风仿写指南
├── ARCHITECTURE.md             # 癸酉本架构解析
├── AGENT_ARCHITECTURE.md       # 多Agent协作架构 ⭐
├── .gitignore
│
├── agents/                     # Agent角色定义
│   ├── pm-agent/README.md      # 项目总控
│   ├── arc-agent/README.md     # 架构Agent
│   ├── sty-agent/README.md     # 文风Agent
│   ├── chr-agent/README.md     # 人物Agent
│   ├── wrt-agent/README.md     # 写作Agent(1-3)
│   ├── edt-agent/README.md     # 统稿Agent
│   ├── rev-scholar/            # 书评:考据派
│   │   ├── README.md
│   │   └── review-template.md
│   ├── rev-critic/             # 书评:文学派
│   │   └── README.md
│   └── rev-modern/             # 书评:现代派
│       └── README.md
│
├── characters/                 # 人物档案
│   ├── baoyu.md               # 贾宝玉
│   ├── daiyu.md               # 林黛玉
│   └── baochai.md             # 薛宝钗
│
├── reference/                  # 参考资料
│   └── vocabulary/
│       └── caoxueqin.md       # 曹雪芹词汇库
│
├── deliverables/              # 交付物隔离区 ⭐
│   ├── README.md              # 交付物示例
│   ├── phase1/                # 前期准备
│   ├── phase2/                # 回目创作
│   ├── phase3/                # 书评评审
│   └── phase4/                # 最终定稿
│
├── chapters/                  # 章节目录
│   ├── draft/                 # 草稿
│   ├── revision/              # 修改稿
│   └── final/                 # 定稿
│
├── docs/                      # 研究资料
│   ├── guixu-analysis/        # 癸酉本研究
│   ├── cao-analysis/          # 前八十回分析
│   └── history/               # 清代背景
│
└── reviews/                   # 书评汇总
```

## 协作流程图

```
Phase 1: 前期准备 (并行)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ARC-Agent] ──▶ architecture-v1.md
[STY-Agent] ──▶ style-guide-v1.md  
[CHR-Agent] ──▶ characters/*.md
       │
       ▼ 三方确认
[PM-Agent] 签字通过
       │
       ▼
Phase 2: 回目创作 (流水线)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ARC-Agent] outline-{N}-v1.md
       │
       ▼ 动机审核
[CHR-Agent] 确认通过
       │
       ▼
[WRT-Agent] draft-{N}-v1.md (10000字)
       │
       ▼ 文风审核
[STY-Agent] sty-review-{N}.md (修改清单)
       │
       ▼ 执行修改
[WRT-Agent] revision-{N}-v1.md
       │
       ▼ 统稿润色
[EDT-Agent] final-{N}-v1.md
       │
       ▼
Phase 3: 书评评审 (随机)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
随机抽取 1-2 位:
├─ [REV-Scholar] 考据派 (30%概率)
├─ [REV-Critic] 文学派 (30%概率)
└─ [REV-Modern] 现代派 (30%概率)
       │
       ▼
review-{N}-{expert}-v1.md
       │
       ▼ 如 REVISE
[WRT-Agent] 修改
       │
       ▼
Phase 4: 定稿
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[EDT-Agent] {N}-final.md
```

## Agent角色速查

| Agent | 职责 | 交付物 | 下游 |
|-------|------|--------|------|
| **PM-Agent** | 项目总控 | 项目看板 | 全部 |
| **ARC-Agent** | 情节架构 | outline-{N}.md | CHR-Agent |
| **STY-Agent** | 文风控制 | style-guide.md, sty-review.md | WRT-Agent |
| **CHR-Agent** | 人物一致性 | characters/*.md, ooc-review.md | WRT-Agent |
| **WRT-Agent** | 执笔创作 | draft-{N}.md, revision-{N}.md | EDT-Agent |
| **EDT-Agent** | 统稿润色 | final-{N}.md | 书评团队 |
| **REV-Scholar** | 考据评审 | review-{N}-scholar.md | PM-Agent |
| **REV-Critic** | 文学评审 | review-{N}-critic.md | PM-Agent |
| **REV-Modern** | 现代评审 | review-{N}-modern.md | PM-Agent |

## 书评专家设定

### REV-Scholar (考据派)
- **身份**: 清史研究专家
- **风格**: 严谨考据，注重史实
- **偏好**: 史实准确，细节到位
- **口头禅**: "此处有误""不确""应改为"

### REV-Critic (文学派)
- **身份**: 当代文学评论家
- **风格**: 学理批评，关注美学
- **偏好**: 悲剧美学，叙事结构
- **口头禅**: "过于""不足""失之"

### REV-Modern (现代派)
- **身份**: 网络文学编辑
- **风格**: 感性直率，只问好看
- **偏好**: 虐得爽，节奏快，情感冲击
- **口头禅**: "我直接说""说实话""这章太拖沓了"

## 交付物命名规范

```
deliverables/
├── phase1/
│   ├── architecture-v{N}.md
│   ├── style-guide-v{N}.md
│   ├── vocabulary-db.md
│   └── characters/
│       └── {name}.md
├── phase2/
│   ├── outline-{NNN}-v{M}.md
│   ├── draft-{NNN}-v{M}.md
│   ├── revision-{NNN}-v{M}.md
│   ├── final-{NNN}-v{M}.md
│   ├── sty-review-{NNN}.md
│   ├── ooc-review-{NNN}.md
│   └── edt-notes-{NNN}.md
├── phase3/
│   └── review-{NNN}-{scholar|critic|modern}-v{M}.md
└── phase4/
    └── {NNN}-final.md
```

## 启动步骤

### Step 1: Phase 1 并行启动

同时启动三个Agent：

```
[ARC-Agent] 任务: 完成 architecture-v1.md
- 分析癸酉本架构
- 设计第81-120回大纲框架
- 建立伏笔照应表

[STY-Agent] 任务: 完成 style-guide-v1.md
- 建立词汇库
- 制定句式模板
- 制定诗词格律规范

[CHR-Agent] 任务: 完成 characters/*.md
- 建立12钗+核心人物档案
- 定义OOC底线
- 提供对话模板
```

### Step 2: Phase 1 确认

PM-Agent组织三方确认：
- [ ] ARC-Agent 确认 STY-Agent 的风格要求可实现
- [ ] STY-Agent 确认 ARC-Agent 的情节可被表达
- [ ] CHR-Agent 确认人物在架构中的行为合理

### Step 3: Phase 2 流水线启动

从第81回开始，逐回流转：

```
ARC-Agent → CHR-Agent → WRT-Agent-01 → STY-Agent → WRT-Agent-01 → EDT-Agent → [书评] → 定稿
```

### Step 4: 持续迭代

每回走完完整流程后，PM-Agent更新项目看板，启动下一回。

## 冲突仲裁

当Agent无法达成一致时，PM-Agent按以下原则仲裁：

| 争议类型 | 裁决依据 |
|----------|----------|
| 史实/考据 | REV-Scholar |
| 文风/语言 | STY-Agent |
| 人物OOC | CHR-Agent |
| 审美/价值 | 书评专家多数意见 |

## 当前状态

- [x] 项目目录创建
- [x] Agent角色定义
- [x] 交付物规范
- [x] 书评专家设定
- [ ] Phase 1 启动（等待指令）

---

**项目已就绪，等待启动 Phase 1。**
