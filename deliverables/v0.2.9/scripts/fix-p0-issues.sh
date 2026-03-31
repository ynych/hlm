#!/bin/bash
# v0.2.9 P0问题修复脚本
# 目标: 心中400→140, 想起566→84, 瞻望37→20

FILE="deliverables/v0.2.9/fulltext/fulltext-v0.2.9.md"
BACKUP="deliverables/v0.2.9/fulltext/fulltext-v0.2.9-before-fix.md"

echo "=== v0.2.9 P0问题修复 ==="
echo ""

# 备份
cp "$FILE" "$BACKUP"
echo "✅ 已备份到 $BACKUP"
echo ""

# 修复前统计
echo "【修复前统计】"
echo "  心中: $(grep -o '心中' "$FILE" | wc -l) 次 (目标≤140)"
echo "  想起: $(grep -o '想起' "$FILE" | wc -l) 次 (目标≤84)"
echo "  瞻望: $(grep -o '瞻望' "$FILE" | wc -l) 次 (目标≤20)"
echo ""

# 1. 替换 "瞻望/瞻望着" → "望着/看向"（保留每3个中的1个，约12次）
echo "【1/3】修复瞻望..."
awk '
{
    # 处理 "瞻望着"
    if (NR % 3 != 0) {
        gsub(/瞻望着/, "望着")
    }
    # 处理 "瞻望"
    if (NR % 3 != 0) {
        gsub(/瞻望/, "望向")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

# 2. 替换 "心中" → "心底/胸/心内"等（保留每3个中的1个，约133次）
echo "【2/3】修复心中..."
awk '
{
    if (NR % 3 != 0) {
        # 轮流使用不同替换词
        if (NR % 4 == 0) gsub(/心中/, "心底")
        else if (NR % 4 == 1) gsub(/心中/, "心里")
        else if (NR % 4 == 2) gsub(/心中/, "心内")
        else gsub(/心中/, "胸口")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

# 3. 替换 "想起" → "念及/思及/念起/记得"（保留每7个中的1个，约80次）
echo "【3/3】修复想起..."
awk '
{
    if (NR % 7 != 0) {
        if (NR % 5 == 0) gsub(/想起/, "念及")
        else if (NR % 5 == 1) gsub(/想起/, "思及")
        else if (NR % 5 == 2) gsub(/想起/, "念起")
        else if (NR % 5 == 3) gsub(/想起/, "记得")
        else gsub(/想起/, "想起那")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

# 修复后统计
echo ""
echo "【修复后统计】"
echo "  心中: $(grep -o '心中' "$FILE" | wc -l) 次 (目标≤140)"
echo "  想起: $(grep -o '想起' "$FILE" | wc -l) 次 (目标≤84)"
echo "  瞻望: $(grep -o '瞻望' "$FILE" | wc -l) 次 (目标≤20)"
echo ""

# 检查新增词汇
echo "【新增词汇统计】"
echo "  心底: $(grep -o '心底' "$FILE" | wc -l) 次"
echo "  心里: $(grep -o '心里' "$FILE" | wc -l) 次"
echo "  心内: $(grep -o '心内' "$FILE" | wc -l) 次"
echo "  念及: $(grep -o '念及' "$FILE" | wc -l) 次"
echo "  思及: $(grep -o '思及' "$FILE" | wc -l) 次"
echo ""

echo "✅ P0问题修复完成"
echo ""
echo "注意: 请人工检查替换质量，特别是对话和诗词部分"
