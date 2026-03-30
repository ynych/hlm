#!/bin/bash
# 《癸酉续红》全文切分脚本
# 将28回全文切分为4个文件（每7回）

INPUT="$1"
OUTPUT_DIR="$2"

if [ -z "$INPUT" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "用法: ./split-fulltext.sh <input-file> <output-dir>"
    echo "示例: ./split-fulltext.sh fulltext-v0.2.7.md ./parts"
    exit 1
fi

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 获取文件总行数
total_lines=$(wc -l < "$INPUT")
echo "总回数: 28回"
echo "总行数: $total_lines"
echo ""

# 找到每个回目的起始行号
echo "查找回目位置..."
grep -n "^# 第八[十一|十二|十三|十四|十五|十六|十七|十八|十九]回\|^# 第九[十一|十二|十三|十四|十五|十六|十七|十八|十九]回\|^# 第一百回" "$INPUT" | head -30

echo ""
echo "========================================"
echo "切分方案:"
echo "========================================"
echo "Part 1: 第81-87回 (渐衰期)"
echo "Part 2: 第88-94回 (崩塌期)"
echo "Part 3: 第95-101回 (离散期)"
echo "Part 4: 第102-108回 (流浪+情榜期)"
echo ""

# 找到切分点（通过正则表达式匹配回目标题）
# 81回开始
echo "正在切分..."

# 使用sed切分
# Part 1: 81-87回
sed -n '1,/^# 第八十八回/p' "$INPUT" | sed '$d' > "$OUTPUT_DIR/part1-ch81-87.md"
echo "✅ Part 1 (81-87回): $OUTPUT_DIR/part1-ch81-87.md"

# Part 2: 88-94回  
sed -n '/^# 第八十八回/,/^# 第九十五回/p' "$INPUT" | sed '$d' > "$OUTPUT_DIR/part2-ch88-94.md"
echo "✅ Part 2 (88-94回): $OUTPUT_DIR/part2-ch88-94.md"

# Part 3: 95-101回
sed -n '/^# 第九十五回/,/^# 第一百零二回/p' "$INPUT" | sed '$d' > "$OUTPUT_DIR/part3-ch95-101.md"
echo "✅ Part 3 (95-101回): $OUTPUT_DIR/part3-ch95-101.md"

# Part 4: 102-108回
sed -n '/^# 第一百零二回/,$p' "$INPUT" > "$OUTPUT_DIR/part4-ch102-108.md"
echo "✅ Part 4 (102-108回): $OUTPUT_DIR/part4-ch102-108.md"

echo ""
echo "========================================"
echo "切分完成"
echo "========================================"

# 统计每个文件的行数
echo ""
echo "各文件行数统计:"
wc -l "$OUTPUT_DIR"/part*.md

echo ""
echo "各文件回数验证:"
for f in "$OUTPUT_DIR"/part*.md; do
    chapters=$(grep -c "^# 第.*回" "$f")
    echo "$(basename $f): $chapters 回"
done
