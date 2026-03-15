# 01-Management 维护机制

**创建日期**: 2026-03-15  
**维护者**: PM-Agent  
**更新频率**: 触发式更新

---

## 一、触发条件

以下情况发生时，必须更新01-Management下的文件：

### 1. 项目状态变更

| 变更类型 | 需更新文件 | 更新内容 |
|---------|-----------|---------|
| 阶段完成/启动 | `05-Status.md` | 更新完成度、状态、时间 |
| 新风险出现 | `06-Risks.md` | 添加新风险条目 |
| 风险状态变更 | `06-Risks.md` | 更新风险状态（活跃/已解决）|
| 里程碑达成 | `05-Status.md` + `01-Project-Overview.md` | 标记完成 |
| 项目时间表调整 | `01-Project-Overview.md` + `05-Status.md` | 更新时间线 |

---

### 2. 架构变更

| 变更类型 | 需更新文件 | 更新内容 |
|---------|-----------|---------|
| 目录结构调整 | `02-Project-Architecture.md` | 更新目录树 |
| 工作流变更 | `02-Project-Architecture.md` | 更新流程说明 |
| Agent职责调整 | `03-Roles.md` | 更新职责定义 |
| 技术栈变更 | `07-Tech-Stack.md` | 更新技术说明 |
| 命名规范变更 | `07-Tech-Stack.md` | 更新规范 |

---

### 3. 决策记录

| 变更类型 | 需更新文件 | 更新内容 |
|---------|-----------|---------|
| 新决策产生 | `04-Decisions/` | 新增决策文件 |
| 决策变更 | `04-Decisions/` | 更新原决策，添加变更说明 |
| 决策执行结果 | `04-Decisions/` | 添加执行总结 |

---

### 4. 文档改进

| 变更类型 | 需更新文件 | 更新内容 |
|---------|-----------|---------|
| 新术语出现 | `09-Glossary.md` | 添加术语定义 |
| 新问题出现 | `10-FAQ.md` | 添加Q&A |
| Git流程变更 | `08-Git-Workflow.md` | 更新流程 |
| 发现文档错误 | 相应文件 | 修复错误 |
| 用户反馈改进 | 相应文件 | 根据反馈优化 |

---

## 二、维护流程

### 自动检查清单

PM-Agent在执行任务前，必须检查：

```markdown
## 任务前检查

- [ ] 当前阶段是否与05-Status.md一致？
- [ ] 是否有新风险需要记录到06-Risks.md？
- [ ] 交付物状态是否需要更新？
- [ ] 是否有新决策需要归档？

## 任务后检查

- [ ] 阶段状态是否变化？
- [ ] 是否有新风险产生？
- [ ] 交付物是否完成？
- [ ] 是否需要更新导航？
```

---

### 更新流程

```
触发条件满足
    ↓
确定需更新文件
    ↓
执行更新
    ↓
更新05-Status.md（如适用）
    ↓
git add + commit + push
    ↓
记录更新日志
```

---

## 三、更新频率

| 文件 | 更新频率 | 触发条件 |
|------|---------|---------|
| `00-Project-Navigation.md` | 架构变更时 | 目录结构调整 |
| `01-Project-Overview.md` | 里程碑时 | 阶段完成/时间调整 |
| `02-Architecture.md` | 保留参考 | 不更新（移至07-Docs）|
| `02-Project-Architecture.md` | 架构变更时 | 目录/工作流变更 |
| `03-Roles.md` | 角色变更时 | Agent职责调整 |
| `04-Decisions/` | 有新决策时 | 每次重要决策 |
| `05-Status.md` | 实时更新 | 每次重要变更后 |
| `06-Risks.md` | 风险变化时 | 新风险/风险解决 |
| `07-Tech-Stack.md` | 技术变更时 | 工具/流程变更 |
| `08-Git-Workflow.md` | 流程变更时 | Git流程调整 |
| `09-Glossary.md` | 有新术语时 | 新增专业术语 |
| `10-FAQ.md` | 有新问题时 | 新增常见问题 |
| `Expert-Review-Report.md` | Review后 | 每次专家Review后 |

---

## 四、更新模板

### 05-Status.md 更新模板

```markdown
## 更新记录

| 时间 | 更新内容 | 提交 |
|------|---------|------|
| YYYY-MM-DD HH:MM | 描述更新内容 | commit-hash |
```

### 06-Risks.md 新增风险模板

```markdown
### Risk-XXX: 风险名称

| 属性 | 内容 |
|------|------|
| **风险ID** | Risk-XXX |
| **风险描述** | 描述 |
| **可能性** | 高/中/低 |
| **影响程度** | 高/中/低 |
| **风险等级** | 🔴/🟡/🟢 |
| **状态** | 活跃 |
| **发现日期** | YYYY-MM-DD |

**缓解措施**:
1. 措施1
2. 措施2

**负责人**: XXX-Agent
```

### 04-Decisions/ 新决策模板

```markdown
# 决策标题

**决策时间**: YYYY-MM-DD  
**决策者**: XXX  
**决策方式**: 选项选择/直接决定

## 决策内容

### 问题
描述问题

### 选项
- A: 选项A
- B: 选项B
- C: 选项C

### 决策
**选择: X**  
说明: 选择理由

## 影响
1. 影响1
2. 影响2
```

---

## 五、维护责任

| 文件 | 维护者 | 备份维护者 |
|------|--------|-----------|
| `00-Project-Navigation.md` | PM-Agent | ARC-Agent |
| `01-Project-Overview.md` | PM-Agent | ARC-Agent |
| `02-Project-Architecture.md` | ARC-Agent | PM-Agent |
| `03-Roles.md` | ARC-Agent | PM-Agent |
| `04-Decisions/` | PM-Agent | 决策相关Agent |
| `05-Status.md` | PM-Agent | 所有Agent可更新 |
| `06-Risks.md` | PM-Agent | 风险发现Agent |
| `07-Tech-Stack.md` | PM-Agent | ARC-Agent |
| `08-Git-Workflow.md` | PM-Agent | 任何Agent |
| `09-Glossary.md` | PM-Agent | 术语发现Agent |
| `10-FAQ.md` | PM-Agent | 问题发现Agent |
| `Expert-Review-Report.md` | PM-Agent | Review专家 |

---

## 六、历史更新记录

| 时间 | 更新内容 | 提交 | 维护者 |
|------|---------|------|--------|
| 2026-03-15 23:15 | 创建本维护机制文档 | 3703181 | PM-Agent |
| 2026-03-15 23:10 | 完整修复01-Management，新增8个文件 | 9fbd5d6 | PM-Agent |
| 2026-03-15 22:57 | 汉化01-Management目录 | 6dd069e | PM-Agent |
| 2026-03-15 22:51 | 重构项目架构为Workflow Model | a3ae8cd | PM-Agent |

---

## 七、检查清单

### 每次任务前

- [ ] 检查05-Status.md，确认当前状态
- [ ] 检查06-Risks.md，确认活跃风险
- [ ] 检查是否有未记录的决策

### 每次任务后

- [ ] 更新05-Status.md中的进度
- [ ] 检查是否产生新风险
- [ ] 检查是否需要更新其他01文件
- [ ] git commit时引用本机制（如有更新）

---

**维护说明**: 本文档由PM-Agent维护，机制变更时更新  
**查看历史**: Git log显示所有修改记录
