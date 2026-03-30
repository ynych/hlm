#!/bin/bash
# 《癸酉续红》质量保证检查脚本
# 用于自动发现P0/P1/P2级问题

FULLTEXT="$1"

if [ -z "$FULLTEXT" ]; then
    echo "用法: ./quality-check.sh <fulltext-file>"
    exit 1
fi

echo "========================================"
echo "《癸酉续红》质量保证检查"
echo "检查文件: $FULLTEXT"
echo "========================================"
echo ""

# P0级检查 - 致命问题
echo "🔴 P0级检查 (致命问题)"
echo "----------------------------------------"

# 1. 角色想起判词
count1=$(grep -c "想起.*判词" "$FULLTEXT" 2>/dev/null || echo 0)
echo "1. '想起判词': $count1 处"
if [ "$count1" -gt 0 ]; then
    grep -n "想起.*判词" "$FULLTEXT" | head -5
    echo "   ... 共 $count1 处"
fi

# 2. 角色总结一生
count2=$(grep -cE "(这一生|这一辈子)" "$FULLTEXT" 2>/dev/null || echo 0)
echo "2. '总结一生': $count2 处"
if [ "$count2" -gt 0 ]; then
    grep -nE "(这一生|这一辈子)" "$FULLTEXT" | head -3
    echo "   ... 共 $count2 处"
fi

# 3. 直接解读判词
count3=$(grep -c "判词.*应了\|判词.*准了\|如今想来.*判词" "$FULLTEXT" 2>/dev/null || echo 0)
echo "3. '解读判词': $count3 处"

# 4. 现代词汇
count4=$(grep -cE "(知道|明白|心理|人格|依靠)" "$FULLTEXT" 2>/dev/null || echo 0)
echo "4. '现代词汇': $count4 处 (需人工复核)"

echo ""
P0_total=$((count1 + count2 + count3))
echo "P0级问题总计: $P0_total 处"
if [ "$P0_total" -eq 0 ]; then
    echo "✅ P0级检查通过"
else
    echo "❌ P0级检查未通过，需要修复"
fi

echo ""
echo "========================================"

# P1级检查 - 重要问题
echo "🟠 P1级检查 (重要问题)"
echo "----------------------------------------"

# 1. 句式重复
count5=$(grep -c "心中越觉" "$FULLTEXT" 2>/dev/null || echo 0)
echo "1. '心中越觉'句式: $count5 处"

# 2. 望着重复
count6=$(grep -c "望着" "$FULLTEXT" 2>/dev/null || echo 0)
echo "2. '望着'使用: $count6 处"

# 3. 判词铺垫检查（简化）
echo "3. 判词铺垫: 需人工检查"

echo ""

# P2级检查 - 优化建议
echo "🟡 P2级检查 (优化建议)"
echo "----------------------------------------"
echo "1. 回末诗格律: 需人工检查"
echo "2. 场景过渡: 需人工检查"
echo "3. 语言精炼: 需人工检查"

echo ""
echo "========================================"
echo "检查完成"
echo "========================================"

# 返回码：有P0问题返回1，否则返回0
if [ "$P0_total" -gt 0 ]; then
    exit 1
else
    exit 0
fi
