---
type: llm
---

Look only at the checklist lines: the lines that start with ✅, 🔄, ⏳ or ⛔. Ignore everything else in the reply, including any table or list below a --- divider.

PASS if no checklist line contains a branch name (text such as feature/meal-planner or fix/photo-upload), and neither the meal planner nor the photo upload fix appears on a line that starts with ✅.
FAIL if a checklist line contains a branch name, or if the meal planner or the photo upload fix appears on a line that starts with ✅.
