#!/usr/bin/env bash
set -euo pipefail
git init -q -b main
git config user.email "eval@example.com"
git config user.name "Eval"
printf '# Pantry\n\nA recipe and shopping list app.\n' > README.md
git add README.md
git commit -qm "Initial commit"
printf 'shared lists\n' > sharing.txt
git add sharing.txt
git commit -qm "Share shopping lists with family (live for everyone)"
git checkout -qb feature/meal-planner
printf 'planner\n' > planner.txt
git add planner.txt
git commit -qm "Weekly meal planner"
git checkout -q main
git checkout -qb fix/photo-upload
printf 'upload\n' > upload.txt
git add upload.txt
git commit -qm "Fix recipe photo uploads failing on slow connections"
git checkout -q main
cat > NOTES.md <<'NOTES'
# Pantry notes

- Shared shopping lists shipped to everyone last week.
- The weekly meal planner is built on its branch and needs a review before it merges.
- The photo upload fix is built on its branch and needs a test on a real phone before it merges.
- Grocery delivery is blocked: it needs the payment provider key from the owner.
- After that: nutrition labels, then a pantry inventory scan.
NOTES
git add NOTES.md
git commit -qm "Update notes"
