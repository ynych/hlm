# Redream项目目录结构规范方案

**日期**: 2026-03-16  
**目标**: 统一命名规范，解决中英文混杂问题

---

## 一、当前问题诊断

### 1. 命名不统一
| 位置 | 问题 | 示例 |
|------|------|------|
| 01-Management | 中英文混杂 | `00-Project-Navigation.md` + `最终决策确认书.md` |
| 02-Planning | 纯中文命名 | `判词与预言对照表.md` |
| 03-Design | 英文命名 | `01-Phase2-Outline/` |

### 2. 重复文件
- `02-Architecture.md` 与 `02-Project-Architecture.md`
- `Expert-Review-Report.md` 同时存在于 01-Management 和 02-Planning

### 3. 目录缺失
- ~~07-Docs~~ 已存在
- ~~01-Management~~ 已存在（但需整理）

---

## 二、规范方案

### 命名规则（推荐）

**选项A：全英文（最规范）**
```
01-Management/
  00-Project-Navigation.md
  01-Project-Overview.md
  02-Architecture.md
  ...

02-Planning/
  01-Framework/
  02-Characters/
  03-Reference/
  04-Planning-Decisions.md
  05-Foreshadowing-Analysis.md      # 原"判词与预言对照表"
  06-Character-Decisions.md         # 原"最终决策确认书"
  07-Sequel-Comparison.md           # 原"各续书结局对比分析"
  08-Unresolved-Predictions.md      # 原"其他未落实判词分析"
  09-Zhi-Comments-Analysis.md       # 原"脂砚斋批语线索梳理"
```

**选项B：全中文（易读）**
```
01-管理/
  00-项目导航.md
  01-项目总览.md
  ...

02-规划/
  01-框架设计/
  02-人物档案/
  03-参考资料/
  ...
```

**选项C：混合（当前实际，不推荐但保持）**
- 目录英文
- 核心文档英文
- 规划文档中文（已创建，不改）

---

## 三、最小改动方案（推荐执行）

保持现状，仅清理重复和冲突：

### 待执行操作

1. **删除重复文件**
   ```bash
   # 02-Architecture.md 与 02-Project-Architecture.md 重复
   # 保留 02-Project-Architecture.md（内容较新）
   rm 01-Management/02-Architecture.md
   
   # Expert-Review-Report.md 重复
   # 保留 02-Planning/Expert-Review-Report.md（内容相关）
   rm 01-Management/Expert-Review-Report.md
   ```

2. **保持中文文档**（已创建，历史原因保留）
   - `最终决策确认书.md`
   - `判词与预言对照表.md`
   - `各续书结局对比分析.md`
   - `其他未落实判词分析.md`
   - `脂砚斋批语线索梳理.md`

3. **新增文档使用英文命名**
   - 从下一批文档开始

---

## 四、建议执行

执行最小改动方案：
- [ ] 删除重复文件
- [ ] 提交Git
- [ ] 后续文档统一使用英文命名

是否执行？
