#!/bin/bash
VERSION=$1
NOTES=$2

git checkout -b release/$VERSION
git add package.json CHANGELOG.md
git commit -m "chore(release): $VERSION [skip ci]\n\n${NOTES}"
git push origin release/$VERSION

gh pr create --base main --head release/$VERSION --title "Release $VERSION" --body "$NOTES"