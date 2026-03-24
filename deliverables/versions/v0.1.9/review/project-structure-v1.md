# Redream 项目目录结构（方案C - 完整版）

```
redream/
├── README.md                          # 项目主入口
├── CHANGELOG.md                       # 版本变更日志
├── STATUS.md                          # 当前状态快照
│
├── tasks/                             # 任务管理
│   ├── plan.md                        # 项目总规划
│   ├── backlog.md                     # 待办事项
│   └── archive/                       # 已完成任务归档
│       └── v0.1.8-completed.md
│
├── deliverables/                      # 交付物
│   └── versions/                      # 版本目录
│       ├── v0.1.9/                    # 当前版本
│       │   ├── README.md              # v0.1.9版本说明
│       │   ├── release-notes.md       # 发布说明
│       │   │
│       │   ├── outline/               # 大纲
│       │   │   ├── outline-rules.md   # 大纲写作规范
│       │   │   └── outline-v0.1.9.md  # v0.1.9大纲
│       │   │
│       │   ├── fulltext/              # 全文
│       │   │   ├── fulltext-rules.md  # 全文写作规范
│       │   │   ├── part-81-87.md      # 第81-87回
│       │   │   ├── part-88-94.md      # 第88-94回
│       │   │   ├── part-95-101.md     # 第95-101回
│       │   │   └── part-102-108.md    # 第102-108回
│       │   │
│       │   ├── review/                # 评审
│       │   │   ├── 4c-review.md               # 4+C评审报告
│       │   │   ├── 4c-review-iter.md          # 迭代评审报告
│       │   │   ├── ooc-issues.md              # OOC问题清单
│       │   │   ├── plan-c-report.md           # 方案C完成报告
│       │   │   └── experts/                   # 专家档案
│       │   │       ├── HIS-002-profile.md     # 清代社会文化专家
│       │   │       ├── LAN-002-profile.md     # 清代白话表达专家
│       │   │       ├── PSY-001-profile.md     # 古典人物心理专家
│       │   │       └── NAR-001-profile.md     # 叙事视角专家
│       │   │
│       │   └── reports/               # 其他报告
│       │       ├── mirofish-prediction.md     # MiroFish预测报告
│       │       └── mirofish-deployment.md     # MiroFish部署指南
│       │
│       ├── v0.1.8/                    # 历史版本v0.1.8
│       │   ├── README.md
│       │   ├── outline/
│       │   ├── fulltext/
│       │   └── review/
│       │
│       └── archive/                   # 更早版本归档
│           └── v0.1.0-v0.1.7/
│
├── agents/                            # 多智能体配置
│   ├── 01-PM/                         # 项目经理
│   ├── 02-ARC/                        # 架构师
│   ├── 03-CHR/                        # 角色设计
│   ├── 04-STY/                        # 风格设计
│   ├── 05-WRT/                        # 写作
│   ├── 06-EDT/                        # 编辑
│   ├── 07-REV/                        # 评审
│   ├── 08-LCT/                        # 语言文化
│   ├── 09-HVT/                        # 重型评审
│   └── 10-CROSS/                      # 交叉检查
│
├── workflows/                         # 工作流
│   ├── skills/                        # 技能定义
│   │   ├── feishu-bitable.md
│   │   ├── feishu-calendar.md
│   │   └── feishu-doc.md
│   │
│   ├── workflows/                     # 工作流定义
│   │   ├── review-4c.md               # 4+C评审流程
│   │   ├── ooc-fix.md                 # OOC修复流程
│   │   └── version-release.md         # 版本发布流程
│   │
│   └── rules/                         # 规则库
│       ├── outline-rules.md           # 大纲规则（全局）
│       └── fulltext-rules.md          # 全文规则（全局）
│
├── docs/                              # 全局文档
│   ├── principles.md                  # 创作原则
│   ├── project-info.md                # 项目信息
│   └── index.md                       # 文档索引
│
├── archive/                           # 归档
│   └── legacy/                        # 旧项目遗留
│
└── .github/                           # GitHub配置
    └── README.md
```

## 关键说明

### 1. 目录命名规则
- 所有目录名：小写英文，连字符分隔
- 所有文件名：小写英文，连字符分隔
- 版本号：v0.1.9 格式（v+主.次.修订）

### 2. 内容语言
- 目录/文件名：英文
- 文件内容：中文

### 3. 版本管理
- `deliverables/versions/` - 所有版本交付物
- `v0.1.9/` - 当前工作版本
- `v0.1.8/` - 上一稳定版本
- `archive/` - 历史版本归档

### 4. 文档归属
- 版本相关文档 → `deliverables/versions/v0.1.9/review/`
- 全局规范文档 → `workflows/rules/`
- 项目状态文档 → 根目录 `STATUS.md`
- 任务规划 → `tasks/`

### 5. 智能体与工作流
- `agents/` - 10个智能体配置
- `workflows/skills/` - 技能定义
- `workflows/workflows/` - 流程定义
- `workflows/rules/` - 全局规则
