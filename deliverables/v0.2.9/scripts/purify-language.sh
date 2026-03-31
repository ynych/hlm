#!/bin/bash
# v0.2.9 语言净化脚本
# 高频词批量替换，保留20%精华

FILE="deliverables/v0.2.9/fulltext/fulltext-v0.2.9.md"
BACKUP="deliverables/v0.2.9/fulltext/fulltext-v0.2.9-backup.md"

# 备份
cp "$FILE" "$BACKUP"
echo "已备份到 $BACKUP"

echo "=== 净化前统计 ==="
echo "凝眸: $(grep -o '凝眸' "$FILE" | wc -l)"
echo "瞻望: $(grep -o '瞻望' "$FILE" | wc -l)"
echo "凭窗而望: $(grep -o '凭窗而望' "$FILE" | wc -l)"
echo "如刀绞: $(grep -o '如刀绞' "$FILE" | wc -l)"
echo ""

# 替换规则（保留1/5，替换4/5）
# 使用行号取模来保留部分原文

# 1. 替换 "瞻望/瞻望着" → "望着/望向/看着"（保留每5个中的1个）
awk '
{
    # 处理 "瞻望着" 
    if (NR % 5 != 0) {
        gsub(/瞻望着/, "望着")
    }
    # 处理 "瞻望"
    if (NR % 5 != 0) {
        gsub(/瞻望/, "望向")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

# 2. 替换 "凝眸/凝眸着" → "凝视/望着"（保留每5个中的1个）
awk '
{
    if (NR % 5 != 0) {
        gsub(/凝眸着/, "凝视着")
        gsub(/凝眸/, "凝视")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

# 3. 替换 "凭窗而望" → "临窗/立在窗前/望向窗外"（保留每5个中的1个）
awk '
{
    if (NR % 5 != 0) {
        # 轮流使用不同替换
        if (NR % 3 == 0) gsub(/凭窗而望/, "临窗")
        else if (NR % 3 == 1) gsub(/凭窗而望/, "望向窗外")
        else gsub(/凭窗而望/, "倚窗")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

# 4. 替换 "如刀绞一般" → "心如刀割/五脏俱焚"（保留每4个中的1个）
awk '
{
    if (NR % 4 != 0) {
        if (NR % 2 == 0) gsub(/如刀绞一般/, "心如刀割")
        else gsub(/如刀绞一般/, "五脏俱焚")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

echo "=== 净化后统计 ==="
echo "凝眸: $(grep -o '凝眸' "$FILE" | wc -l)"
echo "瞻望: $(grep -o '瞻望' "$FILE" | wc -l)"
echo "凭窗而望: $(grep -o '凭窗而望' "$FILE" | wc -l)"
echo "如刀绞: $(grep -o '如刀绞' "$FILE" | wc -l)"

echo ""
echo "✅ 语言净化完成"
echo "注意：请人工检查替换质量，必要时手动调整"
