# 方案A迁移问题标记

## 已完成迁移
- ✅ /tmp/redream_poetry*.md → lifecycle/04-review/v0.1.1/
- ✅ /root/archive/guixu-redream/ → archive/guixu-legacy/
- ✅ 临时文件清理

## 待处理问题（主线完成后处理）

### 1. Skill迁移问题 🔴
**位置**: ~/.openclaw/skills/redream-cli/
**问题**: 迁移到主项目后，OpenClaw可能无法识别
**解决方案**: 
- 方案1: 保持原位，创建软链接
- 方案2: 修改OpenClaw配置，添加新的skill路径
- 方案3: 将skill作为独立npm包发布
**优先级**: 低（当前skill功能可用）

### 2. Workflow整合问题 🟡
**位置**: ~/apps/redream/workflows/
**问题**: 需要验证与guixu-legacy中的workflow是否冲突
**解决方案**:
- 对比两个workflow目录
- 合并或选择性保留
**优先级**: 低

### 3. Git历史问题 🟡
**问题**: guixu-legacy有自己的git历史，合并后历史丢失
**解决方案**:
- 方案1: 作为子模块保留
- 方案2: 使用git subtree合并历史
- 方案3: 仅保留文件，放弃历史
**优先级**: 低

### 4. 路径引用问题 🟡
**问题**: guixu-legacy中的文件可能包含绝对路径引用
**解决方案**:
- 全局搜索并替换路径
- 或使用相对路径重构
**优先级**: 中

## 建议处理顺序
1. 完成v0.1.0交付物主线任务
2. 验证guixu-legacy内容是否可访问
3. 处理skill路径问题（如需要）
4. 整合workflow
5. 清理原始位置文件

## 原始位置备份
- /root/archive/guixu-redream/ （已复制，可删除）
- ~/.openclaw/skills/redream-cli/ （保持原位，待处理）
