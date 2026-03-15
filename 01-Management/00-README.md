# Guiyu Sequel Project Structure

**Architecture**: Workflow Model (Proposal B)  
**Date**: 2026-03-15  

---

## Directory Structure

```
01-Management/                 # Project Management
    ├── 00-README.md                    # Project introduction
    ├── 01-Project-Overview.md          # PROJECT-MASTER-PLAN.md
    ├── 02-Architecture.md              # ARCHITECTURE.md
    ├── 03-Roles.md                     # AGENT_ARCHITECTURE.md
    ├── 04-Decisions/                   # Decision records
    │   └── Phase-1-Decisions.md
    └── 05-Project-Backup.md            # PROJECT.md

02-Planning/                   # Research & Planning
    ├── 01-Framework/                   # Phase 1 framework
    ├── 02-Characters/                  # Character profiles
    ├── 03-Reference/                   # Research materials
    └── 04-Planning-Decisions.md        # plan.md

03-Design/                     # Outline & Key Scenes (Phase 2-3)
    ├── 01-Phase2-Outline/              # 28-chapter outline
    │   ├── 00-Phase2-Plan.md
    │   ├── Outline_Confirmation_Checklist.md
    │   ├── 关键剧情导航.md
    │   └── 关键剧情对照表.md
    ├── 02-Phase3-Materials/            # Design materials
    │   ├── foreshadowing-table-v2.md
    │   ├── poetry-collection-v1.md
    │   └── key-dialogues-v1.md
    └── 03-Key-Scenes/                  # Key scene designs

04-Agents/                     # Multi-Agent System
    ├── 00-Agent-Architecture.md
    ├── 01-PM/                          # PM-Agent
    ├── 02-ARC/                         # ARC-Agent
    ├── 03-CHR/                         # CHR-Agent
    ├── 04-STY/                         # STY-Agent
    ├── 05-WRT/                         # WRT-Agent
    ├── 06-EDT/                         # EDT-Agent
    └── 07-REV/                         # REV-Agents

05-Writing/                    # Chapter Production (Phase 4-7)
    ├── 00-Style-Guide.md               # STYLE_GUIDE.md
    ├── 01-Start-Guide.md               # START_GUIDE.md
    ├── 02-Draft/                       # Phase 4: Drafts
    ├── 03-Revision/                    # Phase 5-6: Revisions
    └── 04-Final/                       # Phase 7: Final chapters

06-Quality/                    # Review & Feedback
    ├── 01-Feedback/                    # User feedback
    └── 02-Quality-Reports/             # Quality check reports

07-Docs/                       # Documentation
    ├── 00-Architecture-Redesign-Proposals.md
    ├── 01-Cao-Analysis/                # Cao Xueqin analysis
    ├── 02-Guixu-Analysis/              # Guiyu edition analysis
    └── 03-History/                     # Historical context

99-Scripts/                    # Automation Scripts
```

---

## Workflow

1. **01-Management**: Project planning, architecture, decisions
2. **02-Planning**: Character design, reference research
3. **03-Design**: Outline creation, key scene design, materials preparation
4. **04-Agents**: Multi-agent collaboration for writing
5. **05-Writing**: Draft → Revision → Final
6. **06-Quality**: Feedback collection, quality control
7. **07-Docs**: Documentation and research archives

---

## Naming Convention

- **Directory names**: English with number prefix (01-, 02-, etc.)
- **File names**: English (kebab-case or CamelCase)
- **Content language**: Chinese (Simplified)

---

## Current Status

- ✅ Phase 0-3: Completed
- ⏳ Phase 4: Draft writing (pending outline confirmation)

---

**Last Updated**: 2026-03-15
