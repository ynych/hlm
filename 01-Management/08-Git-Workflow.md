# Git工作流

**创建日期**: 2026-03-15  
**维护者**: PM-Agent  
**适用对象**: 所有项目参与者

---

## 一、工作流概述

本项目采用**简化版Git工作流**，适合单人/少人协作项目。

### 核心原则
- **单分支**: 只使用 `main` 分支
- **直接提交**: 所有更改直接提交到main
- **频繁推送**: 小步快跑，每次重要变更后推送
- **清晰提交信息**: 便于追溯历史

### 工作流图

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   编辑文件   │────▶│   提交变更   │────▶│   推送到    │
│  (OpenClaw) │     │  (git commit)│     │  GitHub     │
└─────────────┘     └─────────────┘     └─────────────┘
       │                                           │
       │         ┌─────────────────────┐          │
       └────────▶│   GitHub远程仓库    │◀─────────┘
                 │  (github.com/ynych) │
                 └─────────────────────┘
```

---

## 二、详细步骤

### Step 1: 编辑文件

**环境**: OpenClaw平台  
**操作**: 使用read/write/edit工具修改文件

**注意事项**:
- 每次专注一个任务
- 定期保存（OpenClaw自动保存）
- 大文件分多次编辑

---

### Step 2: 查看变更

**命令**:
```bash
cd /root/apps/redream
git status
```

**预期输出**:
```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   01-Management/00-Project-Navigation.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	01-Management/05-Status.md
```

**解读**:
- `modified`: 已修改的文件
- `Untracked files`: 新增的文件

---

### Step 3: 添加文件

**添加所有变更**:
```bash
git add -A
```

**添加特定文件**:
```bash
git add 01-Management/05-Status.md
```

**检查添加结果**:
```bash
git status
```

预期输出:
```
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   01-Management/00-Project-Navigation.md
	new file:   01-Management/05-Status.md
```

---

### Step 4: 提交变更

**基本提交**:
```bash
git commit -m "[模块] 简要描述"
```

**详细提交**（推荐）:
```bash
git commit -m "[模块] 简要描述

详细说明

- 变更点1
- 变更点2
- 变更点3"
```

**提交信息规范**:

| 元素 | 说明 | 示例 |
|------|------|------|
| [模块] | 变更涉及的模块 | [Management], [Design], [Writing] |
| 简要描述 | 一句话概括 | 添加项目状态看板 |
| 详细说明 | 可选，多行描述 | 包含目的、变更点等 |

**提交信息示例**:
```
[Management] 添加项目状态看板

- 创建05-Status.md，跟踪项目进度
- 包含阶段完成度、交付物状态、阻塞项
- 更新频率：每次重要变更后
```

```
[Design] 完成第88回大纲动机审核

- CHR-Agent审核通过，评分8.8/10
- 确认贾母托孤场景合理性
- 无严重OOC问题
```

---

### Step 5: 推送到GitHub

**命令**:
```bash
git push origin main
```

**预期输出**:
```
Enumerating objects: 12, done.
Counting objects: 100% (12/12), done.
Delta compression using up to 4 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 4.20 KiB | 4.20 MiB/s, done.
Total 8 (delta 3), reused 0 (delta 0)
To github.com:ynych/redream.git
   862035e..a3ae8cd  main -> main
```

**完成**！变更已同步到GitHub。

---

## 三、完整示例

### 场景：创建新文件并推送

```bash
# 1. 进入项目目录
cd /root/apps/redream

# 2. 创建/编辑文件
# (使用OpenClaw write/edit工具)

# 3. 查看变更
git status

# 4. 添加文件
git add -A

# 5. 提交
git commit -m "[Management] 添加项目状态看板

- 跟踪各阶段完成度
- 列出交付物状态
- 标识当前阻塞项"

# 6. 推送
git push origin main
```

### 场景：修改多个文件

```bash
# 1. 修改多个文件
# - 修改 01-Management/00-Project-Navigation.md
# - 修改 01-Management/01-Project-Overview.md
# - 新增 01-Management/05-Status.md

# 2. 一次性添加并提交
git add -A
git commit -m "[Management] 汉化并优化01-Management目录

- 新增00-Project-Navigation.md（中文）
- 重命名所有文件为中文名
- 删除过时备份文件
- 更新架构为Workflow Model"

git push origin main
```

---

## 四、常用命令速查

### 查看状态
```bash
git status              # 查看当前状态
git status -s           # 简洁模式
```

### 查看历史
```bash
git log                 # 完整历史
git log --oneline       # 简洁历史（一行一个提交）
git log --oneline -10   # 最近10条
git log --graph         # 图形化显示
```

### 查看差异
```bash
git diff                # 查看未暂存的变更
git diff --staged       # 查看已暂存但未提交的变更
```

### 撤销操作
```bash
# 撤销未暂存的修改（谨慎使用）
git restore 文件名

# 撤销已暂存的修改（回到未暂存状态）
git restore --staged 文件名

# 修改最后一次提交
git commit --amend -m "新的提交信息"
```

### 远程操作
```bash
git remote -v           # 查看远程仓库地址
git fetch origin        # 获取远程更新（不合并）
git pull origin main    # 拉取并合并远程更新
```

---

## 五、提交信息模板

### 模块分类

| 模块 | 说明 | 示例 |
|------|------|------|
| [Management] | 项目管理 | 架构调整、决策记录 |
| [Planning] | 规划阶段 | 人物档案、参考资料 |
| [Design] | 设计阶段 | 大纲、伏笔、诗词、对话 |
| [Agents] | Agent系统 | Agent配置、审核报告 |
| [Writing] | 创作阶段 | 初稿、修订稿、定稿 |
| [Quality] | 质量保障 | 反馈、质量报告 |
| [Docs] | 文档资料 | 研究资料、分析文档 |

### 常用动词

- 添加 (Add)
- 修改 (Update)
- 删除 (Remove)
- 修复 (Fix)
- 重构 (Refactor)
- 完成 (Complete)
- 审核 (Review)
- 优化 (Optimize)

---

## 六、最佳实践

### ✅ 应该做的

1. **频繁提交**
   - 每个逻辑变更单独提交
   - 不要累积大量变更后一次性提交

2. **清晰的提交信息**
   - 使用[模块]前缀
   - 简要描述在第一行
   - 详细说明在后续行

3. **及时推送**
   - 重要变更后立即推送
   - 不要长时间本地积压

4. **定期拉取**
   - 开始工作前拉取最新代码
   - 避免冲突

### ❌ 不应该做的

1. **不要提交敏感信息**
   - 密码、API Key、个人隐私

2. **不要提交临时文件**
   - 已设置.gitignore排除

3. **不要使用模糊的提交信息**
   - ❌ "更新"
   - ❌ "修改"
   - ✅ "[Design] 完成第88回大纲动机审核"

4. **不要直接修改历史**（除非确定知道后果）
   - 避免使用 `git rebase` 或 `git reset --hard`

---

## 七、故障排除

### 问题1: 推送被拒绝

**症状**:
```
! [rejected]        main -> main (fetch first)
error: failed to push some refs to 'github.com:ynych/redream.git'
```

**原因**: 远程仓库有更新，本地不是最新

**解决**:
```bash
git pull origin main
git push origin main
```

### 问题2: 冲突

**症状**:
```
Auto-merging 01-Management/00-Project-Navigation.md
CONFLICT (content): Merge conflict in 01-Management/00-Project-Navigation.md
Automatic merge failed; fix conflicts and then commit the result.
```

**解决**:
1. 手动编辑冲突文件
2. 删除冲突标记（`<<<<<<<`, `=======`, `>>>>>>>`）
3. 保留正确内容
4. 重新提交

### 问题3: 忘记提交信息

**症状**: 打开文本编辑器要求输入提交信息

**解决**:
- 输入提交信息，保存关闭编辑器
- 或者取消（Ctrl+C），重新使用 `-m` 参数提交

---

## 八、高级用法（可选）

### 查看特定文件历史
```bash
git log -p 01-Management/05-Status.md
```

### 查看某行代码最后修改者
```bash
git blame 01-Management/05-Status.md
```

### 临时保存未完成工作
```bash
git stash               # 暂存
git stash pop          # 恢复
```

---

## 九、参考链接

| 资源 | 链接 |
|------|------|
| Git官方文档 | https://git-scm.com/doc |
| GitHub文档 | https://docs.github.com/cn |
| 项目仓库 | https://github.com/ynych/redream |
| 技术栈文档 | `07-Tech-Stack.md` |

---

**维护说明**: 本文档由PM-Agent维护，Git流程变更时更新  
**更新记录**: 查看Git log
