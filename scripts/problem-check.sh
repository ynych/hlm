#!/bin/bash
# Redream 快速问题检查脚本
# 使用方法: ./scripts/problem-check.sh [版本号]

VERSION=${1:-"v0.2.10"}
BASEDIR="/root/apps/redream/deliverables/${VERSION}"

echo "=========================================="
echo "Redream 问题检查 - ${VERSION}"
echo "=========================================="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

# 检查1: v0.1.8 旧版本标记
echo "[检查1] 旧版本标记(v0.1.8)..."
V018_COUNT=$(grep -r "v0.1.8" ${BASEDIR}/fulltext/ 2>/dev/null | wc -l)
if [ $V018_COUNT -gt 0 ]; then
    echo -e "${RED}✗ 发现 ${V018_COUNT} 处旧版本标记!${NC}"
    grep -n "v0.1.8" ${BASEDIR}/fulltext/*.md | head -5
    ((ERRORS++))
else
    echo -e "${GREEN}✓ 未发现旧版本标记${NC}"
fi
echo ""

# 检查2: 白话表达
echo "[检查2] 白话表达(躺在床上等)..."
BAIHUA_COUNT=$(grep -r "躺在床上\|爬回" ${BASEDIR}/fulltext/ 2>/dev/null | wc -l)
if [ $BAIHUA_COUNT -gt 0 ]; then
    echo -e "${RED}✗ 发现 ${BAIHUA_COUNT} 处白话表达!${NC}"
    grep -n "躺在床上\|爬回" ${BASEDIR}/fulltext/*.md | head -5
    ((ERRORS++))
else
    echo -e "${GREEN}✓ 未发现白话表达${NC}"
fi
echo ""

# 检查3: 分卷数量
echo "[检查3] 分卷文件数量..."
FILE_COUNT=$(ls ${BASEDIR}/fulltext/*.md 2>/dev/null | wc -l)
if [ $FILE_COUNT -ne 5 ]; then
    echo -e "${YELLOW}⚠ 分卷文件数量: ${FILE_COUNT} (期望5: part1-4 + 完整版)${NC}"
    ((WARNINGS++))
else
    echo -e "${GREEN}✓ 分卷文件数量正确(5个)${NC}"
fi
echo ""

# 检查4: 回末诗
echo "[检查4] 回末诗完整性..."
MISSING_POEM=0
for file in ${BASEDIR}/fulltext/*part*.md; do
    if [ -f "$file" ]; then
        COUNT=$(grep -c "【回末诗】" "$file" 2>/dev/null)
        if [ $COUNT -lt 7 ]; then
            echo -e "${YELLOW}⚠ $(basename $file): 仅 ${COUNT} 处回末诗 (期望7)${NC}"
            ((MISSING_POEM++))
        fi
    fi
done
if [ $MISSING_POEM -eq 0 ]; then
    echo -e "${GREEN}✓ 所有分卷回末诗完整${NC}"
fi
echo ""

# 检查5: 版本号一致性
echo "[检查5] 版本号一致性..."
VERSION_IN_FILE=$(grep -o "v[0-9]\+\.[0-9]\+\.[0-9]\+" ${BASEDIR}/fulltext/*part1.md | head -1 | cut -d: -f2)
if [[ $VERSION_IN_FILE == *$VERSION* ]]; then
    echo -e "${GREEN}✓ 版本号一致(${VERSION})${NC}"
else
    echo -e "${YELLOW}⚠ 版本号可能不一致: 文件内 ${VERSION_IN_FILE}, 期望 ${VERSION}${NC}"
    ((WARNINGS++))
fi
echo ""

# 总结
echo "=========================================="
echo "检查结果"
echo "=========================================="
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ 全部通过，无问题!${NC}"
else
    echo -e "${RED}✗ 错误: ${ERRORS}${NC}"
    echo -e "${YELLOW}⚠ 警告: ${WARNINGS}${NC}"
    echo ""
    echo "请检查 PROBLEM_TRACKING.md 了解修复方法"
fi
echo ""
