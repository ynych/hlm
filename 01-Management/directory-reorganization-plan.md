# Redream 项目目录整理方案

**整理时间**: 2026-03-17  
**原则**: 保持一级目录不变，规范二三级目录

---

## 当前一级目录（保持不变）

```
01-Management/     # 项目管理
02-Planning/       # 规划与决策
03-Design/         # 设计文档
04-Agents/         # AI Agent配置
05-Writing/        # 创作稿件
06-Quality/        # 质量保障
07-Publish/        # 发布版本
07-Docs/           # 文档资料（注意：与07-Publish重复）
99-Scripts/        # 脚本工具
```

---

## 主要整理任务

### 1. 07-Publish vs 07-Docs 合并
**问题**: 有两个07开头的目录  
**方案**: 将07-Docs内容合并到02-Planning/03-Reference/，删除07-Docs

### 2. 03-Design/01-Phase2-Outline/ 版本统一
**问题**: 多版本文件混乱  
**方案**: 
- 只保留最新版: `outline-v0.0.7.md`
- 备份旧版到: `03-Design/01-Phase2-Outline/versions/`
- 删除: outline-v0.0.5.md, outline-v0.0.6.md, outline-v9.5.md等

### 3. 06-Quality/ 结构优化
**问题**: 评审报告散落  
**方案**:
```
06-Quality/
├── 01-Review-Reports/          # 评审报告
│   ├── ARC/                    # 判词落实评审
│   ├── CHR/                    # 人物一致性评审
│   ├── STY/                    # 文风评审
│   ├── HVT/                    # 历史准确性评审
│   ├── RHY/                    # 结构节奏评审
│   ├── POE/                    # 诗词格律评审
│   └── RED/                    # 红学专家评审
├── 02-Comparisons/             # 对比分析
│   ├── v0.0.7-vs-guixu/        # 与癸酉本对比
│   └── v0.0.7-vs-v0.0.6/       # 版本对比
├── 03-Fixes-Tracker/           # 修复记录
└── 04-Expert-Scores/           # 专家评分汇总
```

### 4. 05-Writing/ 结构统一
**问题**: 大纲与全文版本号不统一  
**方案**:
```
05-Writing/
├── 01-Outline/                 # 大纲版本
│   ├── v0.0.6/                 # v0.0.6大纲
│   ├── v0.0.7/                 # v0.0.7大纲（当前）
│   └── archive/                # 旧版归档
├── 02-Draft/                   # 初稿
│   └── v0.0.6/                 # 对应v0.0.6大纲的初稿
└── 03-Revision/                # 修订稿
```

### 5. 文件命名规范
**统一格式**:
- 大纲: `outline-v{版本号}.md`
- 对比报告: `comparison-{版本A}-vs-{版本B}.md`
- 评审报告: `review-{专家代码}-v{版本号}.md`
- 修复记录: `fixes-v{版本号}.md`

---

## 执行清单

- [ ] 合并07-Docs到02-Planning
- [ ] 整理03-Design/01-Phase2-Outline/版本
- [ ] 重构06-Quality/目录
- [ ] 统一05-Writing/结构
- [ ] 规范化所有文件名
- [ ] 更新INDEX.md链接
- [ ] 更新MEMORY.md记录

---

**确认后开始执行**
