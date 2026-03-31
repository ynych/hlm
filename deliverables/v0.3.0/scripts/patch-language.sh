#!/bin/bash
# v0.3.0 语言净化脚本
# 基于 language-filter.json 执行高频词替换

SOURCE="deliverables/v0.1.9/fulltext/fulltext-v0.1.9.md"
TARGET="deliverables/v0.3.0/fulltext-v0.3.0.md"

# 复制原文为工作文件
cp "$SOURCE" "$TARGET"

echo "=== v0.3.0 语言净化开始 ==="
echo "源文件: $SOURCE"
echo "目标文件: $TARGET"
echo ""

# 统计当前频次
echo "【替换前统计】"
echo "如刀绞一般: $(grep -o '如刀绞一般' "$TARGET" | wc -l) 次"
echo "心中一惊: $(grep -o '心中一惊' "$TARGET" | wc -l) 次"
echo "心中茫然: $(grep -o '心中茫然\|眼中茫然' "$TARGET" | wc -l) 次"
echo ""

# 1. 替换"如刀绞一般"（保留20%约3次）
echo "【处理】如刀绞一般 → 心如刀割/五脏俱焚..."
grep -n '如刀绞一般' "$TARGET" | head -5
# 实际替换需要人工审核，这里输出位置供参考

echo ""
echo "【手动替换指南】"
echo "请在以下位置进行替换："
echo "1. 保留最感人的3处'如刀绞一般'"
echo "2. 其余替换为：心如刀割、五脏俱焚、痛不可当、揪心"
echo "3. 避免同一回内重复"
echo ""

# 2. 替换"心中一惊"
echo "【处理】心中一惊 → 心头一凛/陡然变色/怔了怔..."
grep -n '心中一惊' "$TARGET" | head -5

echo ""
echo "【手动替换指南】"
echo "1. 保留最需要的5-8处'心中一惊'"
echo "2. 其余替换为：心头一凛、陡然变色、怔了怔、愣住、瞳孔微缩"
echo ""

# 3. 替换"眼中茫然"（宝玉相关，需要特殊处理）
echo "【处理】眼中茫然 → 去除，改为动作描写"
grep -n '眼中.*茫然\|茫然.*眼' "$TARGET"

echo ""
echo "【特殊处理】"
echo "这些'茫然'主要在宝玉身上，请用baoyu-rework场景替换"
echo ""

echo "=== 下一步 ==="
echo "1. 人工执行上述替换"
echo "2. 将baoyu-rework场景应用到全文"
echo "3. 运行验证脚本 check-quality.sh"
