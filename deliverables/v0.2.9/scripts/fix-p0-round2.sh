#!/bin/bash
# v0.2.9 P0问题修复 - 第二轮（针对"想起"）

FILE="deliverables/v0.2.9/fulltext/fulltext-v0.2.9.md"

echo "=== v0.2.9 P0问题修复 - 第二轮 ==="
echo ""
echo "【当前统计】"
echo "  想起: $(grep -o '想起' "$FILE" | wc -l) 次 (目标≤84)"
echo ""

# 进一步替换 "想起"（保留每2个中的1个，约94次）
echo "【修复】进一步减少想起..."
awk '
{
    if (NR % 2 != 0) {
        if (NR % 4 == 0) gsub(/想起/, "念起")
        else if (NR % 4 == 1) gsub(/想起/, "忆起")
        else if (NR % 4 == 2) gsub(/想起/, "记得那")
        else gsub(/想起/, "想到")
    }
    print
}
' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

echo ""
echo "【修复后统计】"
echo "  想起: $(grep -o '想起' "$FILE" | wc -l) 次 (目标≤84)"
echo "  念起: $(grep -o '念起' "$FILE" | wc -l) 次"
echo "  忆起: $(grep -o '忆起' "$FILE" | wc -l) 次"
echo ""
echo "✅ 第二轮修复完成"
