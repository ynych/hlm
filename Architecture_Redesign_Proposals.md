# Project Architecture Redesign Proposals

**Project**: Guiyu Sequel  
**Date**: 2026-03-15  
**Status**: Awaiting user selection

---

## Current Structure Issues

### Root Directory Files (Need Classification)
| File | Current Location | Issue |
|------|-----------------|-------|
| README.md | Root | Needs to go to 01-Project |
| PROJECT.md | Root | Duplicate with PROJECT-MASTER-PLAN |
| PROJECT-MASTER-PLAN.md | Root | Needs to go to 01-Project |
| plan.md | Root | Duplicate/Needs classification |
| PHASE2_PLAN.md | Root | Needs to go to 03-Deliverables/Phase2 |
| decisions-phase1.md | Root | Needs to go to 04-Decisions |
| AGENT_ARCHITECTURE.md | Root | Needs to go to 02-Agents |
| ARCHITECTURE.md | Root | Needs to go to 01-Project |
| STYLE_GUIDE.md | Root | Needs to go to 05-Guides |
| START_GUIDE.md | Root | Needs to go to 05-Guides |

### Current Directories (Need Renumbering)
- agents/ → Need numbering
- chapters/ → Need numbering  
- characters/ → Need numbering
- deliverables/ → Need numbering
- docs/ → Need numbering
- feedback/ → Need numbering
- reference/ → Need numbering
- scripts/ → Need numbering

---

## Proposal A: Waterfall Model (Phase-Based)

**Structure Philosophy**: Organize by project phases (0-7)

```
00-Project/                    # Project management
    ├── 00-README.md
    ├── 01-Project-Overview.md          # PROJECT-MASTER-PLAN.md
    ├── 02-Architecture.md              # ARCHITECTURE.md
    └── 03-Roles-and-Responsibilities.md

01-Planning/                   # Phase 0-1: Planning & Framework
    ├── 01-Project-Charter.md           # PROJECT.md
    ├── 02-Planning-Decisions.md        # decisions-phase1.md
    └── 03-Project-Plan.md              # plan.md

02-Agents/                     # Multi-Agent System
    ├── 00-Agent-Architecture.md        # AGENT_ARCHITECTURE.md
    ├── 01-PM-Agent/
    ├── 02-Arc-Agent/
    ├── 03-Chr-Agent/
    ├── 04-Sty-Agent/
    ├── 05-Wrt-Agent/
    ├── 06-Edt-Agent/
    └── 07-Rev-Agents/

03-Deliverables/               # Phase 2-3: Design & Materials
    ├── Phase-1-Framework/
    ├── Phase-2-Outline/
    │   └── 00-Phase2-Plan.md           # PHASE2_PLAN.md
    ├── Phase-3-Materials/
    └── Phase-4-Draft/

04-Guides/                     # Writing Guidelines
    ├── 01-Style-Guide.md               # STYLE_GUIDE.md
    └── 02-Start-Guide.md               # START_GUIDE.md

05-Characters/                 # Character Profiles
    ├── 01-Daiyu/
    ├── 02-Baoyu/
    ├── 03-Baochai/
    └── ...

06-Chapters/                   # Final Chapters (81-108)
    ├── Draft/
    ├── Revision/
    └── Final/

07-Reference/                  # Research Materials
    ├── 01-Cao-Analysis/
    ├── 02-Guixu-Analysis/
    ├── 03-History/
    └── 04-Vocabulary/

08-Feedback/                   # User Feedback
    └── Chapter-081.md

99-Scripts/                    # Automation Scripts
```

**Pros**:
- ✅ Clear phase progression (00→01→02...)
- ✅ Easy to track project status
- ✅ Aligns with 8-phase project plan

**Cons**:
- ❌ Agents split from deliverables (they work together)
- ❌ Characters isolated from planning

---

## Proposal B: Workflow Model (Process-Based)

**Structure Philosophy**: Organize by workflow stages (Plan → Design → Write → Review)

```
01-Management/                 # Project Management
    ├── 00-README.md
    ├── 01-Project-Overview.md
    ├── 02-Architecture.md
    ├── 03-Roles.md
    └── 04-Decisions/                   # decisions-phase1.md

02-Planning/                   # Research & Planning
    ├── 01-Framework/
    ├── 02-Characters/                  # characters/
    ├── 03-Reference/                   # reference/
    └── 04-Planning-Decisions.md        # plan.md

03-Design/                     # Outline & Key Scenes
    ├── 01-Phase2-Outline/              # deliverables/phase2
    │   └── 00-Phase2-Plan.md
    ├── 02-Phase3-Materials/            # deliverables/phase3
    └── 03-Key-Scenes/

04-Agents/                     # Agent System
    ├── 00-Agent-Architecture.md
    ├── 01-PM/
    ├── 02-ARC/
    ├── 03-CHR/
    ├── 04-STY/
    ├── 05-WRT/
    ├── 06-EDT/
    └── 07-REV/

05-Writing/                    # Chapter Production
    ├── 00-Style-Guide.md
    ├── 01-Start-Guide.md
    ├── 02-Draft/                       # chapters/draft
    ├── 03-Revision/                    # chapters/revision
    └── 04-Final/                       # chapters/final

06-Quality/                    # Review & Feedback
    ├── 01-Feedback/                    # feedback/
    └── 02-Quality-Reports/

07-Docs/                       # Documentation
    ├── 01-Cao-Analysis/                # docs/cao-analysis
    ├── 02-Guixu-Analysis/              # docs/guixu-analysis
    └── 03-History/                     # docs/history

99-Scripts/                    # Automation
```

**Pros**:
- ✅ Follows actual workflow: Plan → Design → Write → Review
- ✅ Characters in planning stage (where they're created)
- ✅ Clear separation of concerns

**Cons**:
- ❌ Deliverables scattered across directories
- ❌ Less obvious for newcomers

---

## Proposal C: Hybrid Model (Recommended)

**Structure Philosophy**: Management + Deliverables + Resources

```
01-Project/                    # Project Management
    ├── 00-README.md
    ├── 01-Overview.md                  # PROJECT-MASTER-PLAN.md
    ├── 02-Architecture.md              # ARCHITECTURE.md + AGENT_ARCHITECTURE.md
    ├── 03-Roles.md
    └── 04-Decisions/                   # decisions-phase1.md
        └── Phase-1-Decisions.md

02-Guides/                     # Writing Guidelines
    ├── 01-Style-Guide.md               # STYLE_GUIDE.md
    ├── 02-Start-Guide.md               # START_GUIDE.md
    └── 03-Planning-Guide.md            # plan.md

03-Design/                     # Phase 1-3 Deliverables
    ├── 01-Framework/                   # Phase 1
    ├── 02-Outline/                     # Phase 2
    │   ├── 00-Outline-Plan.md          # PHASE2_PLAN.md
    │   ├── 81-Chapter.md
    │   └── ...
    ├── 03-Materials/                   # Phase 3
    │   ├── 01-Foreshadowing.md
    │   ├── 02-Poetry.md
    │   └── 03-Dialogues.md
    └── 04-Key-Scenes.md

04-Characters/                 # Character Profiles
    ├── 01-Daiyu/
    ├── 02-Baoyu/
    ├── 03-Baochai/
    └── ...

05-Agents/                     # Multi-Agent System
    ├── 01-PM/
    ├── 02-ARC/
    ├── 03-CHR/
    ├── 04-STY/
    ├── 05-WRT/
    ├── 06-EDT/
    └── 07-REV/

06-Chapters/                   # Phase 4-7 Deliverables
    ├── 00-Chapter-Index.md
    ├── 01-Draft/                       # Phase 4
    ├── 02-Revision/                    # Phase 5-6
    ├── 03-Final/                       # Phase 7
    └── 04-Feedback/                    # feedback/

07-Reference/                  # Research Materials
    ├── 01-Cao-Analysis/
    ├── 02-Guixu-Analysis/
    ├── 03-History/
    ├── 04-Vocabulary/
    └── 05-External/

98-Docs/                       # Additional Documentation
    └── Archive/

99-Scripts/                    # Automation Scripts
```

**Pros**:
- ✅ **Management** (01-02) → **Design** (03-04) → **Production** (05-06) → **Resources** (07-99)
- ✅ Clear deliverables location (03-Design, 06-Chapters)
- ✅ Agents separate but connected to production
- ✅ Balanced structure

**Cons**:
- ❌ Phase numbering not explicit (but can be documented)

---

## Proposal D: Strict Phase Model (Aligned with 8 Phases)

**Structure Philosophy**: Strictly follow 8-phase project plan

```
00-Project/                    # Project Overview
    ├── 00-README.md
    ├── 01-Master-Plan.md
    └── 02-Decisions/

01-Phase0-Setup/               # Phase 0: Setup
    ├── 00-Phase0-Plan.md
    ├── 01-Architecture.md
    ├── 02-Agent-Architecture.md
    └── 03-Initial-Decisions.md

02-Phase1-Framework/           # Phase 1: Framework
    ├── 00-Phase1-Plan.md
    ├── 01-Core-Themes.md
    ├── 02-Character-Profiles/        # characters/
    └── 03-Initial-Outline.md

03-Phase2-Outline/             # Phase 2: Outline
    ├── 00-Phase2-Plan.md             # PHASE2_PLAN.md
    ├── 01-Ch81-87/
    ├── 02-Ch88-94/
    ├── 03-Ch95-102/
    ├── 04-Ch103-108/
    └── 05-Confirmation/

04-Phase3-Materials/           # Phase 3: Materials
    ├── 00-Phase3-Plan.md
    ├── 01-Foreshadowing.md
    ├── 02-Poetry.md
    ├── 03-Dialogues.md
    └── 04-Key-Scenes.md

05-Phase4-Draft/               # Phase 4: Draft Writing
    ├── 00-Phase4-Plan.md
    ├── 01-Batch-1-Ch81-87/
    ├── 02-Batch-2-Ch88-94/
    ├── 03-Batch-3-Ch95-102/
    └── 04-Batch-4-Ch103-108/

06-Phase5-Review/              # Phase 5: First Review
    ├── 00-Phase5-Plan.md
    └── 01-Style-OOC-Review/

07-Phase6-Unification/         # Phase 6: Second Review
    ├── 00-Phase6-Plan.md
    └── 01-Unified-Draft/

08-Phase7-Final/               # Phase 7: Final Delivery
    ├── 00-Phase7-Plan.md
    └── 01-Final-Delivery/

09-Agents/                     # Agent System
    ├── 01-PM/
    ├── 02-ARC/
    ├── 03-CHR/
    ├── 04-STY/
    ├── 05-WRT/
    ├── 06-EDT/
    └── 07-REV/

10-Guides/                     # Writing Guidelines
    ├── 01-Style-Guide.md
    └── 02-Start-Guide.md

11-Reference/                  # Research Materials
    ├── 01-Cao/
    ├── 02-Guixu/
    └── 03-History/

12-Feedback/                   # User Feedback

99-Scripts/                    # Automation
```

**Pros**:
- ✅ Perfectly aligns with 8-phase project plan
- ✅ Easy to track progress by phase number
- ✅ Very clear for project management

**Cons**:
- ❌ Agents isolated from phases (they work across phases)
- ❌ Many directories (12 at top level)
- ❌ Characters buried in Phase 1

---

## Comparison Summary

| Aspect | Proposal A (Waterfall) | Proposal B (Workflow) | Proposal C (Hybrid) | Proposal D (Strict Phase) |
|--------|----------------------|---------------------|-------------------|-------------------------|
| **Clarity** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Alignment with 8 Phases** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Workflow Logic** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Ease of Use** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Scalability** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |

---

## My Recommendation

**Proposal C (Hybrid Model)** is recommended because:

1. **Balanced Structure**: Management → Design → Production → Resources
2. **Clear Deliverables**: Design (03) and Chapters (06) are prominent
3. **Agent Integration**: Agents (05) are near production (06)
4. **Character Visibility**: Characters (04) are in design stage
5. **Not Overwhelming**: 7 main directories, manageable
6. **Flexible**: Can accommodate phase changes

---

## Selection Options

**Please select one of the following**:

- [ ] **Proposal A**: Waterfall Model (Phase-Based) - Clean phase progression
- [ ] **Proposal B**: Workflow Model (Process-Based) - Follows actual workflow  
- [ ] **Proposal C**: Hybrid Model (Recommended) - Balanced approach
- [ ] **Proposal D**: Strict Phase Model (Aligned with 8 Phases) - Strict alignment

**Or provide modifications**:
- "C, but move Characters to 03-Design"
- "A, but merge Agents into deliverables"

---

## After Selection: File Migration Plan

Once you select a proposal, I will:

1. Create new directory structure
2. Move all root-level files to correct locations
3. Rename directories with numbers
4. Ensure all filenames are English, content is Chinese
5. Update internal links
6. Push to Git with clear commit message

---

**Waiting for your selection...**
