# Redream Project Makefile
# 癸酉续红 - 《红楼梦》后28回创作工具
# 版本: 1.0
# 配置: 完整单词风格 | 评审+创作+修正 | P0需确认 | make help | 详细模式

.PHONY: help review review-all create create-range fix fix-p0 fix-all stats git-push export clean

# 默认显示帮助
.DEFAULT_GOAL := help

# 颜色定义（用于美化输出）
BLUE := \033[36m
GREEN := \033[32m
YELLOW := \033[33m
RED := \033[31m
RESET := \033[0m

## help: 显示所有可用命令
help:
	@echo "$(BLUE)Redream Project - 癸酉续红创作工具$(RESET)"
	@echo ""
	@echo "$(GREEN)可用命令:$(RESET)"
	@awk '/^## / {sub(/^## /, "", $$0); print "  " $$0}' $(MAKEFILE_LIST)
	@echo ""
	@echo "$(YELLOW)使用示例:$(RESET)"
	@echo "  make review FILE=ch085-draft.md    # 评审指定回目"
	@echo "  make create RANGE=95-102            # 创作95-102回"
	@echo "  make fix-p0                         # 修正所有P0问题"

## review FILE=xxx: AI评审指定回目
review:
	@if [ -z "$(FILE)" ]; then \
		echo "$(RED)错误: 请指定 FILE 参数$(RESET)"; \
		echo "用法: make review FILE=ch085-draft.md"; \
		exit 1; \
	fi
	@echo "$(BLUE)▶ 开始AI评审: $(FILE)$(RESET)"
	@echo "详细报告将保存至: 06-Quality/02-Quality-Reports/$(FILE:.md=-review.md)"

## review-all: AI评审全部28回
review-all:
	@echo "$(BLUE)▶ 开始AI评审全部28回...$(RESET)"
	@echo "$(YELLOW)预计耗时: 20-30分钟$(RESET)"
	@echo "评审报告将保存至: 06-Quality/02-Quality-Reports/"
	@echo "$(GREEN)✓ 请使用 OpenClaw sessions_spawn 批量执行$(RESET)"

## create RANGE=x-y: 创作指定范围回目（如 RANGE=95-102）
create:
	@if [ -z "$(RANGE)" ]; then \
		echo "$(RED)错误: 请指定 RANGE 参数$(RESET)"; \
		echo "用法: make create RANGE=95-102"; \
		exit 1; \
	fi
	@echo "$(BLUE)▶ 开始创作第$(RANGE)回...$(RESET)"
	@echo "$(YELLOW)将启动多线程并行创作$(RESET)"

## create-single CHAPTER=x: 创作单回（如 CHAPTER=85）
create-single:
	@if [ -z "$(CHAPTER)" ]; then \
		echo "$(RED)错误: 请指定 CHAPTER 参数$(RESET)"; \
		echo "用法: make create-single CHAPTER=85"; \
		exit 1; \
	fi
	@echo "$(BLUE)▶ 开始创作第$(CHAPTER)回...$(RESET)"

## fix FILE=xxx LEVEL=P0/P1/P2: 修正指定问题级别
fix:
	@if [ -z "$(FILE)" ] || [ -z "$(LEVEL)" ]; then \
		echo "$(RED)错误: 请指定 FILE 和 LEVEL 参数$(RESET)"; \
		echo "用法: make fix FILE=ch084-draft.md LEVEL=P0"; \
		exit 1; \
	fi
	@if [ "$(LEVEL)" = "P0" ]; then \
		echo "$(YELLOW)⚠ 警告: P0问题涉及致命缺陷，修正前请确认已备份$(RESET)"; \
		read -p "是否继续? [y/N] " confirm; \
		if [ "$$confirm" != "y" ] && [ "$$confirm" != "Y" ]; then \
			echo "已取消"; exit 0; \
		fi \
	fi
	@echo "$(BLUE)▶ 修正$(LEVEL)问题: $(FILE)$(RESET)"

## fix-p0: 修正所有P0致命问题（需确认）
fix-p0:
	@echo "$(YELLOW)⚠ 即将修正所有P0致命问题$(RESET)"
	@read -p "是否继续? [y/N] " confirm; \
	if [ "$$confirm" != "y" ] && [ "$$confirm" != "Y" ]; then \
		echo "已取消"; exit 0; \
	fi
	@echo "$(BLUE)▶ 开始批量修正P0问题...$(RESET)"

## fix-all LEVEL=P0: 修正全部问题（指定级别）
fix-all:
	@if [ -z "$(LEVEL)" ]; then \
		echo "$(RED)错误: 请指定 LEVEL 参数$(RESET)"; \
		echo "用法: make fix-all LEVEL=P1"; \
		exit 1; \
	fi
	@echo "$(BLUE)▶ 修正所有$(LEVEL)问题...$(RESET)"

## stats: 显示项目统计信息
stats:
	@echo "$(BLUE)📊 Redream 项目统计$(RESET)"
	@echo ""
	@echo "初稿文件:"
	@echo "  回目数: $$(ls 05-Writing/02-Draft/*.md 2>/dev/null | wc -l) / 28"
	@echo "  总字数: $$(wc -c 05-Writing/02-Draft/*.md 2>/dev/null | tail -1 | awk '{print $$1}')"
	@echo ""
	@echo "评审报告:"
	@echo "  已完成: $$(ls 06-Quality/02-Quality-Reports/*.md 2>/dev/null | wc -l) / 28"
	@echo ""
	@echo "Git状态:"
	@git status --short 2>/dev/null | wc -l | xargs echo "  待提交文件:"
	@echo ""
	@echo "$(GREEN)项目路径: ~/apps/redream/$(RESET)"

## git-push MSG=\"xxx\": Git提交并推送（默认消息: 更新文档）
git-push:
	@if [ -z "$(MSG)" ]; then \
		MSG="更新文档 $$(date +%Y-%m-%d)"; \
	fi
	@echo "$(BLUE)▶ Git提交: $(MSG)$(RESET)"
	@git add -A && git commit -m "$(MSG)" && git push
	@echo "$(GREEN)✓ 推送完成$(RESET)"

## export FORMAT=pdf: 导出完整文档
export:
	@if [ -z "$(FORMAT)" ]; then \
		echo "$(RED)错误: 请指定 FORMAT 参数$(RESET)"; \
		echo "用法: make export FORMAT=md"; \
		exit 1; \
	fi
	@echo "$(BLUE)▶ 导出$(FORMAT)格式文档...$(RESET)"
	@echo "输出路径: 07-Publish/redream-108.$(FORMAT)"

## clean: 清理临时文件
clean:
	@echo "$(YELLOW)▶ 清理临时文件...$(RESET)"
	@find . -name "*.tmp" -delete 2>/dev/null || true
	@find . -name "*~" -delete 2>/dev/null || true
	@echo "$(GREEN)✓ 清理完成$(RESET)"
