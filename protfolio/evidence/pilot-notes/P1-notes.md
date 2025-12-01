# Pilot Study Notes - Participant P1

**Session ID**: P1_a7f3  
**Date**: 2025-12-01  
**Start Time**: 09:30  
**End Time**: 09:36  
**Duration**: 6 minutes

---

## Participant Details

**Variant**: Mouse + HTMX (Standard setup)  
**Browser**: Chrome 131 on Windows 11  
**Screen Resolution**: 1920×1080  
**Accessibility Tools**: None (standard user)  
**Experience Level**: Moderate computer user, first-time task manager user

---

## Consent

**Consent Script Read?**: ✅ Yes (09:29)  
**Verbal Consent Given?**: ✅ Yes (09:29)  
**Consent Timestamp**: 2025-12-01 09:29:45  
**Participant understood rights?**: Yes, confirmed they could withdraw anytime

---

## Task Observations

### Task 0: Initial Load (T0_list)
**Start**: 09:30:15  
**End**: 09:30:16  
**Duration**: 1 second  
**Outcome**: ✅ Success

**Notes**:
- Page loaded quickly with HTMX
- Found task list immediately
- Interface clear and intuitive

---

### Task 1: Add New Task (T1_add)
**Start**: 09:31:23  
**End**: 09:31:28  
**Duration**: 5 seconds  
**Target**: <10 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 09:31:23 - Clicked on "Add Task" form field
- 09:31:25 - Typed "Buy groceries for weekend"
- 09:31:27 - Clicked "Add" button
- 09:31:28 - Task appeared in list with HTMX smooth update

**Quote**: "That was quick and easy. The form is simple to use."

**Minor Issue (09:31:30)**: Attempted to add another task with blank title to test

**Quote**: "Error just says 'invalid' but doesn't tell me what to fix. I guess title is required?"

**Finding**: Generic validation error messages (Priority 4)

---

### Task 2: Edit Task (T2_edit)
**Start**: 09:32:45  
**End**: 09:32:53  
**Duration**: 8 seconds  
**Target**: <12 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 09:32:46 - Found "Buy groceries" task in list
- 09:32:47 - Clicked "Edit" button, inline form appeared
- 09:32:50 - Changed title to "Buy groceries and milk"
- 09:32:52 - Clicked "Save"
- 09:32:53 - Changes applied smoothly

**Quote**: "Inline editing is convenient. No page navigation needed."

---

### Task 3: Filter Task (T3_filter)
**Start**: 09:33:52  
**End**: 09:34:01  
**Duration**: 9 seconds  
**Target**: <15 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 09:33:53 - Located search box at top
- 09:33:55 - Typed "groceries"
- 09:33:57 - Clicked "Apply Filter" button
- 09:34:01 - Filtered list appeared with matching task

**Quote**: "Search works well. Found my task quickly."

---

### Task 4: Navigate Task List (T4_navigate)
**Start**: 09:34:48  
**End**: 09:34:53  
**Duration**: 5 seconds  
**Target**: <8 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 09:34:49 - Cleared filter to see full list (now has ~8 tasks)
- 09:34:51 - Visually scanned list for specific task
- 09:34:53 - Found "Call dentist" task

**Quote (09:34:54)**: "With many tasks all items look identical, hard to prioritize. Some color coding would help."

**Finding**: Task list lacks visual hierarchy (Priority 2)

---

### Task 5: Delete Task (T5_delete)
**Start**: 09:35:32  
**End**: 09:35:35  
**Duration**: 3 seconds  
**Target**: <6 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 09:35:33 - Found "Buy milk" task
- 09:35:34 - Clicked "Delete" button
- 09:35:35 - Confirmation appeared, clicked "Confirm", task removed

**Quote (09:35:36)**: "Delete button text is hard to read in bright light. Maybe needs darker color?"

**Finding**: Delete confirmation has insufficient contrast (Priority 5)

---

## Post-Task Interview

### Overall Experience
**Question**: "How was the overall experience using the task manager?"  
**Response**: "Pretty straightforward. The interface is clean and tasks are easy to complete. Two things bothered me: unclear error messages and the visual design could be improved."

### Specific Issues Identified

#### Issue 1: Generic Error Messages (09:31:30)
**Context**: Attempted to add task with blank title  
**Observation**: "Error just says 'Invalid input'. I had to guess what was wrong. Should say 'Title is required' or something specific."

**Severity**: Moderate (Priority 4)  
**Linked to Finding**: Generic validation error messages

---

#### Issue 2: Poor Visual Hierarchy (09:34:54)
**Context**: Scanning list with 8+ tasks  
**Observation**: "All tasks look the same - same font size, same color, no priority indicators. Would be nice to have high-priority tasks stand out with red color or bold text."

**Severity**: Low (Priority 2)  
**Linked to Finding**: Task list lacks visual hierarchy

---

#### Issue 3: Button Contrast (09:35:36)
**Context**: Looking at delete button in bright office lighting  
**Observation**: "The button text is a bit faded - gray on white. In bright light it's hard to read. Darker text would be better."

**Severity**: Moderate (Priority 5)  
**Linked to Finding**: Delete confirmation has insufficient contrast

---

## Metrics Summary (from metrics.csv)

| Task | Duration (ms) | Status | HTTP | Line in CSV | vs Target |
|------|---------------|--------|------|-------------|-----------|
| T0_list | 892 | success | 200 | L1 | N/A |
| T1_add | 5234 | success | 200 | L2 | ✅ 5.2s < 10s |
| T2_edit | 7456 | success | 200 | L3 | ✅ 7.5s < 12s |
| T3_filter | 8923 | success | 200 | L4 | ✅ 8.9s < 15s |
| T4_navigate | 4567 | success | 200 | L5 | ✅ 4.6s < 8s |
| T5_delete | 3234 | success | 200 | L6 | ✅ 3.2s < 6s |

**Overall Success Rate**: 6/6 (100%)  
**Tasks Meeting Target**: 5/5 (100%)  
**Average Performance**: All tasks completed well under target times

---

## WCAG Observations

**Strengths**:
- All tasks completable with mouse
- HTMX provides smooth interactions
- No blocking issues for standard users

**Minor Issues**:
- Error messages unclear (affects all users)
- Visual design lacks hierarchy (usability)
- Some contrast issues (WCAG 1.4.3 Level AA)

---

## Evaluator Notes

**Strengths**:
- Fast task completion (all under target)
- Interface intuitive for first-time user
- HTMX interactions smooth and responsive

**Issues Identified**:
- Validation feedback needs improvement (generic errors)
- Visual design could enhance usability (hierarchy, contrast)
- All issues affect UX but don't block tasks

**Participant Background**:
- Office worker, moderate computer skills
- First time using this type of task manager
- Good feedback on usability improvements

**Baseline Data**:
- P1 provides baseline times for mouse+HTMX variant
- Use these times to compare with keyboard/SR variants
- All P1 times are near expert time × 1.5 (good usability)

---

**Notes Completed By**: Xuezhe Sheng  
**Timestamp**: 2025-12-01 09:40