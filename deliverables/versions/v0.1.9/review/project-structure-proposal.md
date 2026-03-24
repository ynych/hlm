# Redream 项目目录结构（方案C - 最终修正版）

## 核心原则
1. **版本中心化** - 文件跟着版本号走
2. **实现无关** - 交付物不绑定工具名称
3. **规则随版本** - checklist/rules 跟随版本
4. **扁平简洁** - 最小层级

```
redream/
├── README.md                          # 项目主入口
├── CHANGELOG.md                       # 版本变更日志
├── STATUS.md                          # 当前状态
│
├── tasks/                             # 任务管理
│   ├── plan.md                        # 项目规划
│   ├── backlog.md                     # 待办
│   └── archive/                       # 已完成
│
├── deliverables/                      # 交付物（核心）
│   └── versions/                      # 版本
│       ├── v0.1.9/                    # 当前版本
│       │   ├── release-notes.md       # 发布说明
│       │   │
│       │   ├── outline/               # 大纲
│       │   │   ├── rules.md           # 本版本规范
│       │   │   ├── checklist.md       # 本版本检查清单
│       │   │   └── content.md         # 大纲内容
│       │   │
│       │   ├── fulltext/              # 全文
│       │   │   ├── rules.md           # 本版本规范
│       │   │   ├── checklist.md       # 本版本检查清单
│       │   │   ├── part-81-87.md
│       │   │   ├── part-88-94.md
│       │   │   ├── part-95-101.md
│       │   │   └── part-102-108.md
│       │   │
│       │   ├── review/                # 评审报告
│       │   │   ├── 4c-review.md
│       │   │   ├── 4c-review-iter.md
│       │   │   ├── ooc-issues.md
│       │   │   └── plan-c-report.md
│       │   │
│       │   └── research/              # 研究结论（无工具名）
│       │       ├── prediction-report.md      # 原mirofish结论
│       │       └── comparison-4versions.md   # 原四版本对比
│       │
│       ├── v0.1.8/                    # v0.1.8版本
│       │   ├── release-notes.md
│       │   ├── outline/
│       │   ├── fulltext/
│       │   ├── review/
│       │   └── research/
│       │
│       ├── v0.1.7/                    # v0.1.7版本
│       │   └── ...
│       │
│       └── archive/                   # v0.1.0-v0.1.6
│           └── v0.1.2/
│               └── fix-v0.1.1-to-v0.1.2.md  # 原FIX文件
│
├── experts/                           # 全局专家档案
│   ├── HIS-002.md
│   ├── LAN-002.md
│   ├── PSY-001.md
│   └── NAR-001.md
│
├── workflows/                         # 工作流与工具
│   ├── rules/                         # 全局规则
│   │   └── writing-principles.md      # 原PRINCIPLES.md
│   │
│   ├── tools/                         # 工具使用指南（有工具名）
│   │   └── mirofish-deployment.md     # 原mirofish部署
│   │
│   └── workflows/                     # 流程定义
│       └── review-4c.md
│
└── archive/                           # 归档
    └── legacy/                        # 旧项目遗留
        └── migration-issues.md        # 原MIGRATION_ISSUES.md
```

## 文件迁移对照表

### 根目录中文文件 → 新位置

| 原文件 | 新位置 | 新文件名 |
|:-------|:-------|:---------|
| `v0.1.9_4C评审报告.md` | `deliverables/versions/v0.1.9/review/` | `4c-review.md` |
| `v0.1.9_OOC问题清单.md` | `deliverables/versions/v0.1.9/review/` | `ooc-issues.md` |
| `v0.1.9_方案C完成报告.md` | `deliverables/versions/v0.1.9/review/` | `plan-c-report.md` |
| `v0.1.9_评审执行报告.md` | `deliverables/versions/v0.1.9/review/` | `execution-report.md` |
| `v0.1.9_迭代4C评审报告.md` | `deliverables/versions/v0.1.9/review/` | `4c-review-iter.md` |
| `四版本对比分析报告.md` | `deliverables/versions/v0.1.9/research/` | `comparison-4versions.md` |
| `情榜对比分析报告.md` | `deliverables/versions/v0.1.9/research/` | `qingbang-comparison.md` |
| `新增专家评审方案.md` | `workflows/` | `expert-review-plan.md` |
| `全文.md` | 删除 | 已分章节 |

### 根目录英文文件 → 新位置

| 原文件 | 新位置 | 新文件名 | 操作 |
|:-------|:-------|:---------|:----:|
| `FIX_PLAN_v0.1.2.md` | `deliverables/versions/v0.1.2/` | `fix-plan.md` | 移动 |
| `FIX_v0.1.0_to_v0.1.1.md` | `deliverables/versions/v0.1.1/` | `fix-from-v0.1.0.md` | 移动 |
| `FIX_v0.1.1_to_v0.1.2.md` | `deliverables/versions/v0.1.2/` | `fix-from-v0.1.1.md` | 移动 |
| `FULLTEXT.md` | 删除 | - | 删除 |
| `INDEX.md` | 删除 | - | 删除 |
| `OUTLINE.md` | 删除 | - | 删除 |
| `PRINCIPLES.md` | `workflows/rules/` | `writing-principles.md` | 移动 |
| `MIGRATION_ISSUES.md` | `archive/legacy/` | `migration-issues.md` | 移动 |
| `PROJECT_STATE_SNAPSHOT.md` | 删除 | - | 删除（过时） |
| `PROJECT_STRUCTURE_PROPOSAL.md` | 删除 | - | 临时文件 |
| `mirofish-deployment-guide.md` | `workflows/tools/` | `mirofish-deployment.md` | 移动 |
| `mirofish-prediction-report.md` | `deliverables/versions/v0.1.9/research/` | `prediction-report.md` | 移动（去工具名） |

### 待删除目录

| 目录 | 操作 | 说明 |
|:-----|:----:|:-----|
| `agents/` | 删除 | 您要求 |
| `docs/` | 删除 | 您要求 |
| `lifecycle/` | 删除 | 旧结构 |
| `FIX/` | 删除 | 合并到versions |
| `fixes/` | 删除 | 合并到versions |
| `rules/` | 删除 | 合并到workflows/rules |

## 关键变化说明

### 1. 版本中心化
- FIX文件 → 对应版本目录
- 评审报告 → 对应版本review/
- 研究结论 → 对应版本research/

### 2. 实现无关
- `mirofish-prediction-report.md` → `prediction-report.md`
- `四版本对比分析报告.md` → `comparison-4versions.md`
- 交付物不显示工具/方法名称

### 3. 规则随版本
- 每个版本的 `outline/rules.md` 和 `outline/checklist.md`
- 全局原则 → `workflows/rules/writing-principles.md`

### 4. 工具分离
- 工具使用方法 → `workflows/tools/`
- 工具产出结论 → `deliverables/versions/vX.X.X/research/`
