# 版本发布流程 (Version Release Flow)

**版本**: v1.0  
**适用范围**: Redream项目vX.Y.Z版本发布  
**创建时间**: 2026-03-23  

---

## 一、版本号规则

### 1.1 语义化版本

采用 `v主版本.子版本.修订号` 格式：

| 位置 | 含义 | 递增条件 | 示例 |
|:----:|:-----|:---------|:-----|
| 主版本(X) | 重大重构 | 全文重写、结构大调 | v1.0.0 (正式发布) |
| 子版本(Y) | 评审迭代 | 每轮专家评审后 | v0.1.0 → v0.1.1 → v0.1.2 |
| 修订号(Z) | 热修复 | P0问题紧急修复 | v0.1.1 → v0.1.1a |

### 1.2 当前版本历史

| 版本 | 日期 | 性质 | 评分 | 里程碑 |
|:-----|:-----|:-----|:----:|:-------|
| v0.1.0 | - | 初版全文 | 86.5/100 | 全文完成 |
| v0.1.1 | - | 五专家评审后修复 | 92.8/100 | 首轮修复 |
| v0.1.2 | 2026-03-23 | 4+1评审后修复 | 91+/100 | 二轮修复 |
| **v0.1.3** | **目标** | **8+2评审后定稿** | **93+/100** | **终审定稿** |

---

## 二、发布流程图

```
修复完成/评审通过
    ↓
版本号确认
    ↓
创建发布文档包
    ├─→ 全文文档
    ├─→ 评审汇总
    ├─→ 修复记录
    └─→ 元数据
    ↓
更新索引文件
    ├─→ STATUS.md
    ├─→ 全文.md (软链)
    └─→ INDEX.md
    ↓
归档旧版本
    ↓
发布确认
```

---

## 三、发布检查清单

### 3.1 发布前检查

**文档完整性**:
- [ ] 全文文档已生成 (`fulltext-vX.Y.Z.md`)
- [ ] 评审汇总已归档 (`EXPERT_REVIEW_SUMMARY_vX.Y.Z.md`)
- [ ] 修复记录已归档 (`FIX_v[X.Y.Z-1]_to_vX.Y.Z.md`)
- [ ] 版本说明已创建 (`V0.X.Y_RELEASE_NOTES.md`)

**版本一致性**:
- [ ] 全文内所有版本号已更新为vX.Y.Z
- [ ] STATUS.md版本号已更新
- [ ] 软链已指向新版本

**质量检查**:
- [ ] 全文无断链、无格式错误
- [ ] 回目编号连续（81-102回）
- [ ] 回末诗格式统一

### 3.2 发布动作

**Step 1: 创建发布目录**

```bash
mkdir -p /root/apps/redream/deliverables/vX.Y.Z/{fulltext,review}
```

**Step 2: 复制文档**

```bash
# 全文
cp FIX/vX.Y.Z/fulltext-vX.Y.Z.md deliverables/vX.Y.Z/fulltext/

# 评审汇总
cp review/EXPERT_REVIEW_SUMMARY_vX.Y.Z.md deliverables/vX.Y.Z/review/

# 修复记录
cp FIX/FIX_v[X.Y.Z-1]_to_vX.Y.Z.md deliverables/vX.Y.Z/

# 版本说明
cp V0.X.Y_RELEASE_NOTES.md deliverables/vX.Y.Z/
```

**Step 3: 更新STATUS.md**

```markdown
# 🎯 Redream 项目状态看板

**最后更新**: YYYY-MM-DD HH:MM  
**当前版本**: vX.Y.Z ([状态])

## 📊 版本状态

| 组件 | 版本 | 状态 | 质量评分 |
|------|------|------|----------|
| **全文** | vX.Y.Z | ✅ [状态] | **XX/100** |

## 🔄 当前阶段

**已完成**: [上一阶段] → [当前阶段]

## 📁 重要文件位置

| 文件 | 路径 | 说明 |
|------|------|------|
| **全文 vX.Y.Z** | `deliverables/vX.Y.Z/fulltext/fulltext-vX.Y.Z.md` | 当前版本 ⭐ |
```

**Step 4: 更新软链**

```bash
# 删除旧软链
rm /root/apps/redream/全文.md

# 创建新软链
ln -s /root/apps/redream/deliverables/vX.Y.Z/fulltext/fulltext-vX.Y.Z.md \
      /root/apps/redream/全文.md
```

**Step 5: 归档旧版本**

```bash
# 将上一版本移入archive
mv /root/apps/redream/deliverables/v[X.Y.Z-1] \
   /root/apps/redream/archive/
```

**Step 6: 创建发布标签**

```bash
cd /root/apps/redream
git tag -a vX.Y.Z -m "Release vX.Y.Z - [描述]"
git push origin vX.Y.Z
```

---

## 四、发布文档包结构

发布时，`deliverables/vX.Y.Z/`目录应包含：

```
/root/apps/redream/deliverables/vX.Y.Z/
├── README.md                          # 版本说明（入口）
├── V0.X.Y_RELEASE_NOTES.md            # 详细发布说明
├── fulltext/
│   └── fulltext-vX.Y.Z.md             # 全文（⭐核心交付物）
├── review/
│   └── EXPERT_REVIEW_SUMMARY_vX.Y.Z.md # 评审汇总
├── FIX_v[X.Y.Z-1]_to_vX.Y.Z.md        # 修复记录（如有）
└── CHECKLIST.md                       # 本版本检查清单
```

---

## 五、版本说明模板

```markdown
# 《癸酉续红》vX.Y.Z 发布说明

**版本号**: vX.Y.Z  
**发布日期**: YYYY-MM-DD  
**质量评分**: XX/100  
**评审结论**: [推荐/强烈推荐/有条件推荐]

## 版本性质

[X.Y.Z版本性质描述]

## 关键改进

1. [改进1]
2. [改进2]
3. [改进3]

## 评审历史

| 轮次 | 专家配置 | 评分 | 结论 |
|:-----|:---------|:----:|:-----|
| 第X轮 | [配置] | XX/100 | [结论] |

## 已知问题

- [问题1]: [描述] ([级别])
- [问题2]: [描述] ([级别])

## 交付物清单

- [ ] 全文文档
- [ ] 评审汇总
- [ ] 修复记录
- [ ] 检查清单

## 使用建议

[针对本版本的使用建议]

---

**文档版本**: vX.Y.Z  
**维护责任**: Redream项目组
```

---

## 六、历史发布记录

| 版本 | 发布日期 | 评分 | 关键交付物 |
|:-----|:---------|:----:|:-----------|
| v0.1.0 | - | 86.5/100 | 初版全文 |
| v0.1.1 | - | 92.8/100 | 五专家评审后修复 |
| v0.1.2 | 2026-03-23 | 91+/100 | 4+1评审后修复 |
| v0.1.3 | 目标 | 93+/100 | 8+2评审后定稿 |

---

**文档版本**: v1.0  
**更新频率**: 每次发布时  
**责任人**: 项目负责人
