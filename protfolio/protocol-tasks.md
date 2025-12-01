# COMP2850 HCI Evaluation Protocol

**Student**: Xuezhe Sheng
**ID**: 201803920  
**Academic Year**: 2025-26

---

## Privacy & Ethics Statement

- ✅ I confirm all participant data is anonymous (session IDs use P1_xxxx format, not real names)
- ✅ I confirm all screenshots are cropped/blurred to remove PII (no names, emails, student IDs visible)
- ✅ I confirm all participants gave informed consent
- ✅ I confirm all results are real and not fabricated
- ✅ I confirm this work is my own

**AI tools used** (if any): GitHub Copilot for debugging focus management in TaskRoutes.kt (lines 168, 175 - suggested tabindex and URL fragment patterns)

---

## 1. Link to Needs-Finding (Week 6 Job Stories)

### Job Story #1
**When** I'm juggling multiple deadlines across different courses and personal commitments,  
**I want** to quickly add tasks without switching context or filling complex forms,  
**so** I can capture todos immediately when they come to mind during lectures or meetings,  
**because** context switching disrupts my focus and I forget tasks if not recorded instantly.

### Job Story #2
**When** I need to update task details because priorities have changed,  
**I want** to edit tasks inline without navigating to separate pages,  
**so** I can make quick updates during my daily review,  
**because** multi-step editing workflows waste time when managing 20+ tasks across multiple projects.

### Job Story #3
**When** I'm looking for a specific task among many items in my list,  
**I want** to filter tasks by keyword quickly,  
**so** I can find relevant tasks without scrolling through irrelevant items,  
**because** scanning long lists manually is time-consuming and error-prone.

---

## 2. Evaluation Tasks (5 Tasks)

### Task 1 (T1): Add New Task
- **Scenario**: You need to remember to "Buy groceries for weekend"
- **Action**: Add a task with the title "Buy groceries for weekend"
- **Success**: Task appears in the task list with no error messages shown
- **Target Time**: <10 seconds (Expert time: 5s × 2)
- **Linked to**: Job Story #1 ("quickly add tasks without switching context")

---

### Task 2 (T2): Edit Task
- **Scenario**: The task "Buy groceries for weekend" needs to include milk
- **Action**: Edit the task to change title to "Buy groceries and milk"
- **Success**: Task title updates and change persists after save
- **Target Time**: <12 seconds (Expert time: 6s × 2)
- **Linked to**: Job Story #2 ("edit tasks inline without navigating")

---

### Task 3 (T3): Filter Task
- **Scenario**: You have multiple tasks and need to find ones related to groceries
- **Action**: Use the search filter to find tasks containing "groceries"
- **Success**: Filtered list shows only matching tasks
- **Target Time**: <15 seconds (Expert time: 7s × 2)
- **Linked to**: Job Story #3 ("filter tasks by keyword quickly")

---

### Task 4 (T4): Navigate Task List
- **Scenario**: You need to locate the task "Call dentist" in your task list
- **Action**: Scan the task list and identify the "Call dentist" task
- **Success**: Participant successfully locates and identifies the task
- **Target Time**: <8 seconds (Expert time: 4s × 2)
- **Linked to**: Job Story #3 ("find relevant tasks without scrolling")

---

### Task 5 (T5): Delete Task
- **Scenario**: The task "Buy milk" is no longer needed
- **Action**: Delete the task "Buy milk" from the list
- **Success**: Task is removed from list and does not reappear after refresh
- **Target Time**: <6 seconds (Expert time: 3s × 2)
- **Linked to**: Job Story #2 (task management efficiency)

---

## 3. Consent Script (Read Verbatim to Participants)

**Introduction**:  
"Thank you for participating in my HCI evaluation. This will take about 10 minutes. I'm testing my task management interface, not you. There are no right or wrong answers."

**Rights**:
- "Your participation is voluntary. You can stop at any time without giving a reason."
- "Your data will be anonymous. I'll use a code like P1 instead of your name."
- "I may take screenshots and notes. I'll remove any identifying information."
- "Do you consent to participate?" [Wait for verbal "yes"]

**Recorded consent timestamp**: [Record here when each participant consents, e.g., "P1 consented 01/12/2025 09:29"]

---

## 4. Participant Consent Log

| Participant | Consent Given? | Datetime Consented | Variant Used |
|-------------|----------------|-------------------|--------------|
| P1          | ✅ Yes         | 01/12/2025 09:29 | Mouse + HTMX |
| P2          | ✅ Yes         | 01/12/2025 09:44 | Keyboard-only, No-JS |
| P3          | ✅ Yes         | 01/12/2025 09:59 | Screen reader + keyboard |
| P4          | ✅ Yes         | 01/12/2025 10:14 | No-JS mode + keyboard |
| P5          | ✅ Yes         | 01/12/2025 14:09 | Screen reader + keyboard (re-pilot) |
| P6          | ✅ Yes         | 01/12/2025 14:29 | Keyboard-only, No-JS (re-pilot) |

---

## 5. Target Time Calculations

| Task | Expert Time (me) | Multiplier | Target Time | Notes |
|------|------------------|------------|-------------|-------|
| T1: Add Task | 5s | ×2 | <10s | Simple form fill + submit |
| T2: Edit Task | 6s | ×2 | <12s | Locate task, inline edit, save |
| T3: Filter Task | 7s | ×2 | <15s | Enter search query, wait for results |
| T4: Navigate | 4s | ×2 | <8s | Scan list, identify correct item |
| T5: Delete Task | 3s | ×2 | <6s | Click delete + confirm |

**Rationale**: Novice users unfamiliar with interface need 2× time to understand affordances, read instructions, and recover from minor mistakes. These targets were validated by running through tasks myself 3 times and taking the average, then multiplying by 2.

**Expert Times Measurement**:
- Measured on 01/12/2025 at 09:00
- Ran through all tasks 3 times to get consistent baseline
- Average times: T1=5.2s, T2=6.1s, T3=7.3s, T4=3.8s, T5=3.1s
- Rounded to nearest second for target calculation

---

## 6. Participant Variant Distribution

### Initial Pilot (Week 9, n=4)
- **P1**: Standard user (mouse + HTMX enabled) - Baseline for typical user
- **P2**: Keyboard-only, No-JS mode - Test keyboard accessibility and progressive enhancement
- **P3**: NVDA screen reader + keyboard - Test screen reader accessibility
- **P4**: No-JS mode + keyboard - Test progressive enhancement with keyboard nav

**Rationale**: 
- 1 standard user (baseline)
- 3 non-standard variants (keyboard, SR, No-JS) to identify accessibility issues
- Covers major accessibility categories: keyboard navigation, screen reader compatibility, progressive enhancement

### Re-Pilot (Week 10, n=2)
- **P5**: NVDA screen reader + keyboard - Re-test Fix #1 (error announcements)
- **P6**: Keyboard-only, No-JS mode - Re-test Fix #2, #3, #4 (keyboard trap, focus management, focus indicators)

**Rationale**:
- Match original problematic variants to directly test fixes
- P5 matches P3 (SR user) to verify error announcement fix
- P6 matches P2/P4 (keyboard users) to verify keyboard fixes

---

## 7. Session ID Cookie Setup

Before each pilot session, set anonymous session ID in browser:

```javascript
// Run in browser console BEFORE pilot starts
// Replace xxxx with random alphanumeric (e.g., a7f3, 9d2e, k3m9)
document.cookie = "sid=P1_a7f3; path=/";  // For participant 1
document.cookie = "sid=P2_9d2e; path=/";  // For participant 2
document.cookie = "sid=P3_k3m9; path=/";  // For participant 3
document.cookie = "sid=P4_x8r2; path=/";  // For participant 4
document.cookie = "sid=P5_n7p4; path=/";  // For participant 5 (re-pilot)
document.cookie = "sid=P6_w2k8; path=/";  // For participant 6 (re-pilot)
```

**Verify cookie set**:
```javascript
// Check cookie is present
document.cookie  // Should show: "sid=P1_xxxx; ..."
```

**CRITICAL**: Must set cookie BEFORE participant starts tasks, otherwise Logger.kt will use "unknown" session ID.

---

## 8. Task Instructions for Participants

Read these instructions to participants at start of each task:

### Task 1: Add Task
"I'd like you to add a new task. The task is: 'Buy groceries for weekend'. Please add this task to your task list. Tell me when you're done."

### Task 2: Edit Task
"Now I'd like you to edit a task. Find the task 'Buy groceries for weekend' and change it to 'Buy groceries and milk'. Tell me when you're done."

### Task 3: Filter Task
"Now I'd like you to search for tasks. Use the search filter to find all tasks containing the word 'groceries'. Tell me when you see the filtered results."

### Task 4: Navigate
"I'd like you to find a specific task in your list. Please locate the task called 'Call dentist'. Tell me when you've found it."

### Task 5: Delete Task
"Finally, I'd like you to delete a task. Please delete the task called 'Buy milk'. Tell me when it's gone from the list."

**Note**: Do NOT provide hints or guidance during tasks. If participant gets stuck, note the timestamp and issue but let them try to resolve it.

---

## 9. Data Collection Checklist

For each participant, collect:

- [ ] Consent timestamp (recorded in table above)
- [ ] Session ID cookie set before tasks (verify in console)
- [ ] Pilot notes with timestamps for each task
- [ ] Quotes (verbatim) for any issues encountered
- [ ] Task completion status (success/failure) and time
- [ ] Post-task interview responses
- [ ] Screenshots of any issues (crop PII!)
- [ ] metrics.csv generated by Logger.kt

**After each participant**:
- [ ] Check `data/metrics.csv` has new rows with correct session_id
- [ ] Save pilot notes to `evidence/pilot-notes/P#-notes.md`
- [ ] Verify no PII in notes or screenshots

---

## 10. Pilot Study Schedule

### Week 9 (Initial Pilot)
- **01/12/2025 09:30-09:36**: P1 (Mouse + HTMX)
- **01/12/2025 09:45-09:53**: P2 (Keyboard-only, No-JS)
- **01/12/2025 10:00-10:08**: P3 (Screen reader + keyboard)
- **01/12/2025 10:15-10:23**: P4 (No-JS mode + keyboard)

### Week 10 (Re-Pilot)
- **01/12/2025 14:10-14:16**: P5 (Screen reader + keyboard)
- **01/12/2025 14:30-14:37**: P6 (Keyboard-only, No-JS)

**Total Time**: ~60 minutes (planning) + 48 minutes (pilots) + 180 minutes (analysis) + 240 minutes (fixes) = 528 minutes (~9 hours)

---

## 11. Equipment & Setup

### Required:
- Laptop with Chrome/Firefox/Safari
- Internet connection for task manager webapp
- Notebook for handwritten observations
- Timer (phone or computer)

### For Screen Reader Participants (P3, P5):
- NVDA 2024.3 installed (Windows)
- OR JAWS (Windows)
- OR VoiceOver (Mac - Cmd+F5 to enable)

### For Keyboard-Only Participants (P2, P4, P6):
- Disable trackpad or disconnect mouse
- OR ask participant to not use mouse voluntarily

### For No-JS Participants (P2, P4, P6):
- Chrome DevTools: Settings → Debugger → Disable JavaScript
- Firefox: about:config → javascript.enabled → false
- Safari: Develop → Disable JavaScript

---

## 12. Privacy & PII Protection

### During Pilots:
- Use only participant codes (P1-P6) in all notes
- Never write down real names, emails, or student IDs
- If participant says personal info, don't record it

### Screenshots:
- Crop browser tabs/bookmarks (may contain personal info)
- Blur any accidental names in task content
- Use generic test data ("Buy groceries" not "Buy John's birthday gift")

### Consent:
- Store consent timestamps separately from pilot notes
- Keep consent log secure (don't upload to GitHub)
- Participants can withdraw - delete their data immediately if requested

---

**Protocol Complete**  
Ready for pilot execution on 01/12/2025