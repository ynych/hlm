---
name: 12-chars-review
description: 十二金钗评审系统 - 用于《癸酉续红》的24位专家评审工作流。支持正册12钗+副册12钗的角色代入评审，OOC检查，文学一致性审查，以及版本迭代优化。Use when users need to review literary works (especially sequels/redreams of classical novels) with multiple character perspectives, or when checking character consistency (OOC), literary value alignment with original works, and iterative optimization.
---

# 十二金钗评审系统

用于《癸酉续红》的二十四金钗（正册12钗+副册12钗）专家评审工作流。

## 核心功能

1. **角色代入评审** - 24位专家各自从角色视角评审
2. **OOC检查** - 人物一致性审查
3. **文学一致性** - 与前80回风格对齐
4. **交叉评审** - 多角色互动合理性检查
5. **版本迭代** - 从v0.2.11到v0.2.15的升级路径

## 使用场景

**触发条件**:
- 用户要求"评审《癸酉续红》"
- 用户要求"检查人物OOC"
- 用户要求"对比前80回风格"
- 用户要求"让十二金钗评审"
- 用户要求"优化续书质量"

## 工作流程

### Step 1: 初始化评审

读取当前版本大纲，建立基准：
```bash
scripts/init_review.py <version> <path/to/outline>
```

### Step 2: 二十四金钗独立评审

每位专家从本角色视角评审：
1. 人物完整性
2. 性格一致性
3. 关键场景表现
4. 与其他角色互动

**专家列表**:

**正册12钗**:
- 潇湘妃子（林黛玉）- 诗意才情、敏感洞察
- 蘅芜君（薛宝钗）- 理性克制、世故智慧
- 凤辣子（王熙凤）- 权力运作、人性算计
- 枕霞旧友（史湘云）- 豪爽豁达、诗酒风流
- 蕉下客（贾探春）- 治家理政、远见卓识
- 菱洲（贾迎春）- 柔弱顺从、命运悲惨
- 藕榭（贾惜春）- 勘破红尘、孤冷决绝
- 琴心（秦可卿）- 风月情浓、警幻先知
- 梅仙（李纨）- 贞静淡泊、母性光辉
- 槛外人（妙玉）- 洁癖高洁、欲洁何曾洁
- 榴花（贾巧姐）- 命运转折、民间视角
- 贵妃（贾元春）- 宫廷政治、家族命运

**副册12钗**:
- 学诗妾侍（香菱）- 学诗执着、命运堪伤
- 绝色才女（薛宝琴）- 才华出众、游历四方
- 贫寒淑女（邢岫烟）- 端庄贤淑、不卑不亢
- 贞静才女（李纹）- 随李纨守寡
- 活泼才女（李绮）- 性格较活泼
- 温柔苦命（尤二姐）- 被凤姐算计
- 刚烈侠女（尤三姐）- 自刎明志
- 忠心贤妾（平儿）- 凤姐陪嫁、照顾巧姐
- 侥幸之妾（娇杏）- 主仆互换对照
- 悍妒主母（夏金桂）- 虐待香菱
- 争宠丫鬟（秋桐）- 与尤二姐争宠
- 闺阁名媛（傅秋芳）- 宝玉倾慕对象

### Step 3: OOC检查

使用OOC检查清单：
- [references/ooc-checklist.md](references/ooc-checklist.md)

检查要点：
1. 人物核心人设是否保持
2. 语言风格是否符合角色
3. 行为逻辑是否自洽
4. 与前80回是否一致

### Step 4: 文学一致性检查

检查维度：
1. **语言风格** - 清代白话、含蓄暗示
2. **行文结构** - 章回体、回末诗
3. **诗词格律** - 平仄合规
4. **悲剧节奏** - 哀而不伤

参考：
- [references/literary-standards.md](references/literary-standards.md)

### Step 5: 交叉评审

专家间交叉评审：
- 直接互动角色
- 命运对照角色
- 家族关联角色

使用交叉评审矩阵：
- [references/cross-review-matrix.md](references/cross-review-matrix.md)

### Step 6: 生成评审报告

```bash
scripts/generate_report.py --format markdown
```

输出：
- 各角色评分
- OOC问题清单
- 文学一致性评价
- 改进建议

### Step 7: 迭代优化

根据评审结果优化：
1. 修正OOC问题
2. 增强情感渲染
3. 深化思想内涵
4. 提升文学价值

## 关键文档

### 人物设定参考
- [references/24-chars-profile.md](references/24-chars-profile.md) - 24位金钗深度人设

### OOC检查清单
- [references/ooc-checklist.md](references/ooc-checklist.md) - OOC检查标准

### 文学标准
- [references/literary-standards.md](references/literary-standards.md) - 与前80回一致性标准

### 交叉评审矩阵
- [references/cross-review-matrix.md](references/cross-review-matrix.md) - 专家评审分工

### 版本迭代指南
- [references/version-upgrade.md](references/version-upgrade.md) - 从v0.2.11到v0.2.15的升级路径

## 示例用法

### 示例1: 初始化评审

用户: "让十二金钗评审v0.2.14版"

Claude:
```bash
scripts/init_review.py v0.2.14 /path/to/outline-v0.2.14.md
```

然后执行24位专家独立评审。

### 示例2: OOC检查

用户: "检查宝钗临终场景是否OOC"

Claude:
1. 读取[references/ooc-checklist.md](references/ooc-checklist.md)
2. 检查宝钗核心人设: "藏愚守拙"
3. 检查临终独白: 是否过于直白
4. 输出: "若有来世我不做宝钗" - 严重OOC
5. 建议修正: 改为动作暗示

### 示例3: 文学一致性检查

用户: "检查语言风格是否与前80回一致"

Claude:
1. 读取[references/literary-standards.md](references/literary-standards.md)
2. 检查: 现代词汇、直白心理、诗词格律
3. 输出问题清单和修正建议

## 评分标准

### 人物评分维度

| 维度 | 权重 | 说明 |
|------|------|------|
| 完整性 | 30% | 故事线是否完整 |
| 一致性 | 30% | 是否OOC |
| 互动性 | 20% | 与其他角色互动合理性 |
| 文学性 | 20% | 语言、诗词、意境 |

### 综合评分等级

- 95-100分: 经典级（传世之作）
- 90-94分: 卓越级（优秀续作）
- 85-89分: 优秀级（合格续作）
- 80-84分: 良好级（可读续作）
- <80分: 需大幅修改

## 输出格式

评审报告应包含：
1. 各角色评分表
2. OOC问题清单
3. 文学一致性评价
4. 具体修改建议
5. 版本升级路径

参考模板：
- [assets/report-template.md](assets/report-template.md)
