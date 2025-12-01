# COMP2850 HCI Evaluation Protocol

**Student**: Xuezhe Sheng
**Academic Year**: 2025-26

---

## Privacy & Ethics Statement

- ✅ I confirm all participant data is anonymous (session IDs use P1_xxxx format, not real names)
- ✅ I confirm all screenshots are cropped/blurred to remove PII (no names, emails, student IDs visible)
- ✅ I confirm all participants gave informed consent
- ✅ I confirm all results are real and not fabricated
- ✅ I confirm this work is my own

**AI tools used**

---

## 1. Link to Needs-Finding (Week 6 Job Stories)

### Job Story #1
**When** I'm juggling multiple deadlines across different projects,  
**I want** to quickly add tasks without switching context or filling complex forms,  
**so** I can capture todos immediately when they come to mind,  
**because** context switching disrupts my focus and I forget tasks if not recorded instantly.

### Job Story #2
**When** I'm reviewing my weekly workload,  
**I want** to see all tasks in a clear, scannable list ordered by priority,  
**so** I can identify what needs attention first,  
**because** visual clutter makes it hard to prioritize effectively.

### Job Story #3
**When** I realize task details have changed (deadline moved, priority shifted),  
**I want** to edit tasks inline without navigating to separate pages,  
**so** I can update information quickly,  
**because** multi-step editing workflows waste time when managing 20+ tasks.

---

## 2. Evaluation Tasks (5 Tasks)

### Task 1 (T1): Add New Task
- **Scenario**: You need to remember to "Submit assignment by Friday"
- **Action**: Add a task with title "Submit assignment by Friday"
- **Success**: Task appears in the task list, no error messages shown
- **Target Time**: <10 seconds
- **Linked to**: Job Story #1 ("quickly add tasks without switching context")

---

### Task 2 (T2): Find Specific Task
- **Scenario**: You have 15 tasks in your list, need to find "Buy groceries"
- **Action**: Use search/filter to locate the task with title "Buy groceries"
- **Success**: Filtered list shows only matching task
- **Target Time**: <12 seconds
- **Linked to**: Job Story #2 ("see all tasks in clear, scannable list")

---

### Task 3 (T3): Edit Task Priority
- **Scenario**: "Team meeting" task priority changed from 3 to 5 (urgent)
- **Action**: Edit the task "Team meeting" to change priority from 3 to 5
- **Success**: Task priority updates, change persists after refresh
- **Target Time**: <15 seconds
- **Linked to**: Job Story #3 ("edit tasks inline without navigating")

---

### Task 4 (T4): Mark Task Complete
- **Scenario**: You finished "Call dentist", need to mark it done
- **Action**: Toggle the task "Call dentist" to completed status
- **Success**: Task shows visual completion state (strikethrough/checkmark)
- **Target Time**: <8 seconds
- **Linked to**: Job Story #2 ("identify what needs attention first")

---

### Task 5 (T5): Delete Task
- **Scenario**: "Buy milk" task is no longer needed
- **Action**: Delete the task "Buy milk" from the list
- **Success**: Task removed from list, does not reappear on refresh
- **Target Time**: <6 seconds
- **Linked to**: Job Story #2 ("clear, scannable list")

---

## 3. Consent Script (Read Verbatim to Participants)

**Introduction**:  
"Thank you for participating in my HCI evaluation. This will take about 15 minutes. I'm testing my task management interface, not you. There are no right or wrong answers."

**Rights**:
- "Your participation is voluntary. You can stop at any time without giving a reason."
- "Your data will be anonymous. I'll use a code like P1 instead of your name."
- "I may take screenshots and notes. I'll remove any identifying information."
- "Do you consent to participate?" [Wait for verbal "yes"]

---

## 4. Participant Consent Log

| Participant | Consent Given? | Datetime Consented | Variant Used |
|-------------|----------------|-------------------|--------------|
| P1          | ✅ Yes         | [01/12/2025 10:15] | [Mouse + HTMX] |
| P2          | ✅ Yes         | [01/12/2025 10:15] | [Keyboard-only] |
| P3          | ✅ Yes         | [01/12/2025 10:15] | [Screen reader + keyboard] |
| P4          | ✅ Yes         | [01/12/2025 10:15] | [No-JS mode] |

---

## 5. Target Time Calculations

| Task | Expert Time (me) | Multiplier | Target Time | Notes |
|------|------------------|------------|-------------|-------|
| T1: Add Task | 5s | ×2 | <10s | Simple form fill + submit |
| T2: Find Task | 6s | ×2 | <12s | Search query + scan results |
| T3: Edit Priority | 7s | ×2 | <15s | Locate task + inline edit + save |
| T4: Toggle Complete | 4s | ×2 | <8s | Single click/keypress action |
| T5: Delete Task | 3s | ×2 | <6s | Click delete + confirm |

**Rationale**: Novice users unfamiliar with interface need 2× time to understand affordances, read instructions, and recover from minor mistakes.