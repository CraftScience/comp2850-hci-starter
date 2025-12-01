# Pilot Study Notes - Participant P4

**Session ID**: P4_x8r2  
**Date**: 2025-12-01  
**Start Time**: 10:15  
**End Time**: 10:23  
**Duration**: 8 minutes

---

## Participant Details

**Variant**: No-JS mode + Keyboard (Non-standard setup)  
**Browser**: Safari 17 on macOS Sonoma  
**Screen Resolution**: 2560×1440  
**Accessibility Tools**: None  
**Input Method**: Keyboard primary, mouse for emergency only  
**Experience Level**: Advanced user, prefers keyboard for efficiency

---

## Consent

**Consent Script Read?**: ✅ Yes (10:14)  
**Verbal Consent Given?**: ✅ Yes (10:14)  
**Consent Timestamp**: 2025-12-01 10:14:45  

---

## Task Observations

### Task 0: Initial Load (T0_list)
**Start**: 10:15:34  
**End**: 10:15:35  
**Duration**: 1 second  
**Outcome**: ✅ Success

**Notes**:
- Page loaded in No-JS mode (verified in Safari Dev Tools)
- All content visible and accessible
- Tab navigation functional

---

### Task 1: Add New Task (T1_add)
**Start**: 10:16:45  
**End**: 10:16:51  
**Duration**: 6 seconds  
**Target**: <10 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 10:16:46 - Tabbed to add task form
- 10:16:48 - Typed "Buy groceries for weekend"
- 10:16:50 - Pressed Enter to submit
- 10:16:51 - Full page reload (No-JS), task appeared in list

**Quote (10:16:52)**: "Focus indicator missing on edit and delete buttons. I can Tab through but can't see where focus is."

**Finding**: No visual focus indicator on buttons (Priority 8)

---

### Task 2: Edit Task (T2_edit - Focus Loss Issue)

#### First Edit Attempt
**Start**: 10:18:12  
**End**: 10:18:14  
**Duration**: 2 seconds  
**Outcome**: ✅ Success (edit saved, but led to next issue)

**Notes**:
- 10:18:13 - Found "Buy groceries" in list
- 10:18:14 - Pressed Enter on Edit button
- 10:18:16 - Changed title to "Buy groceries and milk"
- 10:18:18 - Pressed Enter to save

#### Issue After First Edit
**Time**: 10:18:20  
**Outcome**: ❌ Focus lost

**Quote (10:18:22)**: "After saving edit, focus disappeared. I'm pressing Tab but nothing is highlighted. Have to start from top of page again."

**Issue Identified**:
- **Focus lost after inline edit** (WCAG 2.4.3 Level A violation)
- Linked to: metrics.csv L24 (focus_lost outcome)
- Impact: User must re-navigate from page top (44 seconds wasted)
- Finding Priority: 6 (High)

#### Second Edit Attempt (to complete task)
**Start**: 10:18:56  
**End**: 10:19:00  
**Duration**: 4 seconds (plus 44s re-navigation time)  
**Total Time**: 48 seconds  
**Target**: <12 seconds  
**Outcome**: ✅ Success (severely exceeded target)

**Notes**:
- Had to Tab from top of page through header, form, all tasks
- Finally reached another Edit button
- Completed edit task successfully

---

### Task 3: Filter Task (T3_filter)
**Start**: 10:20:23  
**End**: 10:20:33  
**Duration**: 10 seconds  
**Target**: <15 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 10:20:24 - Tabbed to search box
- 10:20:27 - Typed "groceries"
- 10:20:30 - Pressed Enter (no filter button in No-JS)
- 10:20:33 - Page reloaded with filtered results

---

### Task 4: Navigate Task List (T4_navigate)
**Start**: 10:21:34  
**End**: 10:21:39  
**Duration**: 5 seconds  
**Target**: <8 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 10:21:35 - Cleared filter
- 10:21:37 - Tabbed through task list
- 10:21:39 - Found "Call dentist" task

---

### Task 5: Delete Task (T5_delete)
**Start**: 10:22:28  
**End**: 10:22:32  
**Duration**: 4 seconds  
**Target**: <6 seconds  
**Outcome**: ✅ Success (under target)

**Notes**:
- 10:22:29 - Found "Buy milk" task
- 10:22:30 - Pressed Enter on Delete button
- 10:22:31 - Confirmation appeared
- 10:22:32 - Pressed Enter to confirm

---

## Post-Task Interview

### Critical Issue 1: Focus Lost After Edit (10:23)

**Quote**: "After saving an edit, focus disappeared completely. I had to start over from the top. This happened and cost me 44 seconds of extra navigation time."

**Details**:
- Focus not returned to logical location after edit save
- Should return to edited task or Edit button
- Currently returns to body element (nowhere visible)
- Violates WCAG 2.4.3 Level A

**Technical Analysis**:
After form POST in No-JS mode, focus defaults to `<body>` element. Should add:
```html
<div id="task-{{ id }}" tabindex="-1" autofocus>
```

**Severity**: High (Priority 6)

---

### Critical Issue 2: Missing Focus Indicator (10:16:52)

**Quote**: "When using Tab, I cannot see where I am. Focus indicator missing on edit and delete buttons. The outline is completely invisible."

**Details**:
- No visible outline on buttons when focused
- Especially bad with keyboard-only navigation
- Had to guess which element had focus
- Violates WCAG 2.4.7 Level AA

**Severity**: Critical (Priority 8)

---

### Positive Feedback

**Quote**: "The No-JS mode works really well. All features available without JavaScript. Form submissions work correctly. Just fix focus management and visual indicators."

---

## Metrics Summary (from metrics.csv)

| Task | Duration (ms) | Status | HTTP | Line in CSV | vs Target | Notes |
|------|---------------|--------|------|-------------|-----------|-------|
| T0_list | 1089 | success | 200 | L22 | N/A | |
| T1_add | 6234 | success | 200 | L23 | ✅ 6.2s < 10s | |
| T2_edit (focus lost) | 0 | focus_lost | 200 | L24 | ❌ | ⚠️ Critical |
| T2_edit (retry) | 12456 | success | 200 | L25 | ❌ 12.5s > 12s | w/ re-nav time |
| T3_filter | 9876 | success | 200 | L26 | ✅ 9.9s < 15s | |
| T4_navigate | 4890 | success | 200 | L27 | ✅ 4.9s < 8s | |
| T5_delete | 3789 | success | 200 | L28 | ✅ 3.8s < 6s | |

**Success Rate**: 4/5 first attempts (80%)  
**Focus Issues**: 1 critical (focus lost after edit)  
**Average Time Inflation**: Edit task took 12.5s vs 7.5s baseline (+67% due to re-nav)

---

## WCAG Violations Identified

### 2.4.3 Focus Order (Level A) ❌ FAIL
**Evidence**: metrics.csv L24 focus_lost, user quote 10:18:22  
**Impact**: Navigation efficiency severely degraded  
**Priority**: 6 (High - should fix)

### 2.4.7 Focus Visible (Level AA) ❌ FAIL
**Evidence**: User quote 10:16:52, visual inspection confirms no outline  
**Impact**: Keyboard navigation extremely difficult  
**Priority**: 8 (Critical - must fix)

---

## Technical Analysis (Post-Session)

### Focus Loss Root Cause
After POST in No-JS mode:
```kotlin
post("/tasks/{id}/edit") {
    // ... save logic ...
    call.respondRedirect("/tasks") // Focus defaults to <body>
}
```

**Fix**: Add autofocus to edited task:
```html
<div id="task-{{ id }}" tabindex="-1" 
     {% if justEdited %}autofocus{% endif %}>
```

---

### Missing Focus Indicator Root Cause
CSS removes default outline:
```css
button:focus {
  outline: none; /* ❌ BAD */
}
```

**Fix**: Add visible focus style:
```css
button:focus {
  outline: 2px solid #0066cc;
  outline-offset: 2px;
}
```

---

## Evaluator Notes

**Strengths**:
- No-JS mode fully functional
- POST-Redirect-GET pattern works
- All CRUD operations available
- Keyboard navigation basically works

**Critical Issues**:
- Focus management missing after edit
- Focus indicators invisible
- Both severely impact keyboard users

**Recommended Fixes**:
1. Add visible focus indicators (2px solid outline) - Priority 8
2. Add autofocus to edited task after save - Priority 6
3. Test focus flow through all interactions

**Participant Background**:
- Advanced user who prefers keyboard
- Good at identifying usability issues
- Patient and provided clear feedback

**No-JS Testing Value**:
- P4 provides baseline for No-JS variant
- Confirms progressive enhancement works
- Identifies focus issues unique to No-JS flow

---

**Notes Completed By**: Xuezhe Sheng
**Timestamp**: 2025-12-01 10:28