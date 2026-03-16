#!/bin/bash
# 生成《癸酉续红》PDF文档

set -e

PROJECT_DIR="/root/apps/redream"
OUTPUT_DIR="$PROJECT_DIR/07-Publish"
OUTPUT_FILE="$OUTPUT_DIR/癸酉续红-第81-108回.pdf"

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 创建临时markdown文件
TMP_MD=$(mktemp)

# 添加封面和前言
cat > "$TMP_MD" <> EOF
---
title: 癸酉续红
subtitle: 《红楼梦》第81-108回
---

# 癸酉续红

## 《红楼梦》第81-108回

**癸酉本架构 · 28回全本**

---

# 前言

《癸酉续红》是基于《红楼梦》癸酉本架构，由AI续写的后28回（第81-108回）。

本项目遵循以下原则：
- 忠实于曹雪芹前80回的精神和风格
- 落实第五回判词和脂批伏笔
- 保持人物性格的连贯性
- 呈现"白茫茫大地真干净"的悲剧结局

**项目结构：**
- 渐衰期（81-87回）：繁华余晖，悲剧潜伏
- 崩塌期（88-94回）：大厦将倾，众人离散
- 离散期（95-102回）：家破人亡，各自飘零
- 流浪期（103-108回）：看破红尘，终归太虚

**版本信息：**
- 创作日期：2026年3月16日
- 总字数：约25万字
- GitHub：https://github.com/ynych/redream

---

EOF

# 合并所有回目
cd "$PROJECT_DIR/05-Writing/02-Draft"

for i in $(seq 81 108); do
    CHAPTER=$(printf "ch%03d-draft.md" $i)
    if [ -f "$CHAPTER" ]; then
        echo "" >> "$TMP_MD"
        echo "---" >> "$TMP_MD"
        echo "" >> "$TMP_MD"
        cat "$CHAPTER" >> "$TMP_MD"
        echo "" >> "$TMP_MD"
    fi
done

# 添加后记
cat >> "$TMP_MD" <> EOF

---

# 后记

## 判词落实总览

### 金陵十二钗正册

| 人物 | 判词 | 落实回目 |
|------|------|----------|
| 林黛玉 | 玉带林中挂 | 第85回 |
| 薛宝钗 | 金簪雪里埋 | 第95回 |
| 贾元春 | 虎兕相逢大梦归 | 第83-87回 |
| 贾探春 | 清明涕送千里东风 | 第87回 |
| 史湘云 | 湘江水逝楚云飞 | 第102回 |
| 妙玉 | 终陷淖泥中 | 第94、101回 |
| 贾惜春 | 独卧青灯古佛旁 | 第94回 |
| 王熙凤 | 哭向金陵事更哀 | 第88、99回 |
| 巧姐 | 偶因济刘氏 | 第100回 |
| 李纨 | 晚韶华 | 第98回 |

---

**满纸荒唐言，一把辛酸泪。**
**都云作者痴，谁解其中味？**

EOF

# 使用pandoc转换为PDF
echo "正在生成PDF..."
if command -v xelatex > /dev/null 2>&1; then
    pandoc "$TMP_MD" \
        -o "$OUTPUT_FILE" \
        --pdf-engine=xelatex \
        -V CJKmainfont="Noto Serif CJK SC" \
        -V geometry:margin=2.5cm \
        -V fontsize=12pt \
        --toc \
        --toc-depth=2 \
        -V documentclass=ctexbook \
        -V colorlinks=true
else
    echo "警告: xelatex未安装，使用基本格式..."
    pandoc "$TMP_MD" \
        -o "$OUTPUT_FILE" \
        --toc \
        --toc-depth=2
fi

# 清理临时文件
rm "$TMP_MD"

# 检查输出
if [ -f "$OUTPUT_FILE" ]; then
    FILESIZE=$(du -h "$OUTPUT_FILE" | cut -f1)
    echo "✓ PDF生成成功: $OUTPUT_FILE"
    echo "  文件大小: $FILESIZE"
else
    echo "✗ PDF生成失败"
    exit 1
fi
