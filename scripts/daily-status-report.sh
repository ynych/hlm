#!/bin/bash
# 癸酉续红项目进展日报生成脚本

KANBAN_FILE="/root/apps/redream/agents/pm-agent/kanban.md"
ARCHITECTURE_FILE="/root/apps/redream/deliverables/phase2/ARCHITECTURE-V2.md"
REVIEW_DIR="/root/apps/redream/deliverables/phase2"

# 读取当前阶段
CURRENT_PHASE=$(grep "当前阶段" "$KANBAN_FILE" | head -1 | sed 's/.*当前阶段.*: //' | sed 's/🚀/ /g' | xargs)

# 读取已审核回目数量
COMPLETED_REVIEWS=$(ls -1 "$REVIEW_DIR"/motivation-review-*.md 2>/dev/null | wc -l)

# 读取最新审核的回目和评分
LATEST_REVIEW=$(ls -t "$REVIEW_DIR"/motivation-review-*.md 2>/dev/null | head -1)
if [ -n "$LATEST_REVIEW" ]; then
    LATEST_CHAPTER=$(basename "$LATEST_REVIEW" | sed 's/motivation-review-//' | sed 's/.md//')
    LATEST_SCORE=$(grep "综合评分" "$LATEST_REVIEW" | head -1 | grep -oE '[0-9]+\.[0-9]+' | head -1)
fi

# 生成提示词
cat << 'EOF'
═══════════════════════════════════════════════════════════════
📋 癸酉续红项目进展日报 | $(date +%Y-%m-%d)
═══════════════════════════════════════════════════════════════

【当前状态】
• 项目阶段: $CURRENT_PHASE
• 大纲审核: $COMPLETED_REVIEWS / 28 回
• 最新审核: 第$LATEST_CHAPTER回 (评分: $LATEST_SCORE/10)

【待办事项】
□ 继续CHR审核 (89-108回, 截止4.05)
□ Phase 3准备 (回末诗格律精修)

═══════════════════════════════════════════════════════════════
🎯 继续使用提示词 (复制使用)
═══════════════════════════════════════════════════════════════

"继续redream项目工作。当前在Phase 2大纲审核阶段，已完成$COMPLETED_REVIEWS回审核。

请查看 ~/apps/redream/agents/pm-agent/kanban.md 了解最新进度，
继续执行CHR审核或其他待办任务。"

═══════════════════════════════════════════════════════════════
EOF
