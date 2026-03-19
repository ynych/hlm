# 飞书群绑定配置

## 绑定群信息

| 属性 | 值 |
|------|-----|
| **群名称** | redream-project |
| **chat_id** | oc_d8f8bf29fda7eeba92cb2a1f13f87627 |
| **绑定时间** | 2026-03-17 11:12 |
| **绑定项目** | ~/apps/redream/ |
| **用途** | 癸酉续红项目协作群 |

## 功能配置

### 当前用途
- [x] 项目进展汇报
- [x] 质量反馈收集
- [x] 版本发布通知

### 待启用功能
- [ ] Agent评审结果推送
- [ ] 每日写作进度报告
- [ ] 质量评估预警

## 相关配置

### 消息推送设置
```json
{
  "chat_id": "oc_d8f8bf29fda7eeba92cb2a1f13f87627",
  "project_path": "~/apps/redream/",
  "notifications": {
    "version_release": true,
    "quality_report": true,
    "agent_review": false,
    "daily_progress": false
  }
}
```

## 历史记录

| 时间 | 操作 | 操作人 |
|------|------|--------|
| 2026-03-17 11:12 | 初始绑定 | Echo |

---
*本文件由 OpenClaw 自动生成*
