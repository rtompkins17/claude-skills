---
type: llm
---

PASS if both are true: the checklist lines near the top of the reply use plain words and do not contain branch names such as feature/meal-planner or fix/photo-upload, and neither the meal planner nor the photo upload fix is marked done with ✅ (they are built but not merged).
FAIL if a branch name appears in those checklist lines, or if the meal planner or the photo upload fix is marked ✅.
