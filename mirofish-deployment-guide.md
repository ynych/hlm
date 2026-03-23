# MiroFish-Offline 部署与使用指南
# 用途: 基于《红楼梦》前80回预测后80回剧情

## 部署步骤

### 1. 克隆仓库
```bash
git clone https://github.com/nikmcfly/MiroFish-Offline.git
cd MiroFish-Offline
cp .env.example .env
```

### 2. 配置环境变量 (.env)
```bash
# LLM (使用本地 Ollama)
LLM_API_KEY=ollama
LLM_BASE_URL=http://localhost:11434/v1
LLM_MODEL_NAME=qwen2.5:14b  # 或 32b

# Neo4j
NEO4J_URI=bolt://localhost:7687
NEO4J_USER=neo4j
NEO4J_PASSWORD=mirofish

# Embeddings
EMBEDDING_MODEL=nomic-embed-text
EMBEDDING_BASE_URL=http://localhost:11434
```

### 3. Docker 一键启动
```bash
docker compose up -d

# 下载模型
docker exec mirofish-ollama ollama pull qwen2.5:14b
docker exec mirofish-ollama ollama pull nomic-embed-text

# 检查状态
docker compose ps
```

### 4. 访问 UI
打开 http://localhost:3000

---

## 预测《红楼梦》后80回

### 输入数据准备
需要准备《红楼梦》前80回的文档，包含：
1. 金陵十二钗判词
2. 主要人物关系
3. 前80回关键情节摘要
4. 脂批提示

### 预测流程
1. **构建知识图谱**: 上传前80回文档 → 提取实体关系
2. **设置仿真环境**: 生成数百个"红学Agent"
3. **运行仿真**: 模拟不同角色对剧情的反应和互动
4. **生成报告**: ReportAgent 分析最可能的后80回走向
5. **交互探索**: 与具体Agent对话，深入探讨剧情细节

---

## 本地执行命令示例

```bash
# 1. 构建知识图谱
curl -X POST http://localhost:5000/api/graph/build \
  -H "Content-Type: application/json" \
  -d '{
    "content": "《红楼梦》前80回内容...",
    "title": "红楼梦前80回",
    "source_type": "novel"
  }'

# 2. 运行仿真
curl -X POST http://localhost:5000/api/simulation/run \
  -H "Content-Type: application/json" \
  -d '{
    "graph_id": "g_hongloumeng",
    "agent_count": 200,
    "simulation_hours": 48,
    "platform": "twitter"
  }'

# 3. 生成预测报告
curl -X POST http://localhost:5000/api/report/generate \
  -H "Content-Type: application/json" \
  -d '{
    "sim_id": "s_hongloumeng",
    "focus_group_size": 15
  }'
```
