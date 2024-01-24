#!/bin/bash
VERSION=$1

git checkout -b release/$VERSION
git add package.json CHANGELOG.md
git commit -m "chore(release): $VERSION [skip ci]"
git push origin release/$VERSION

gh pr create --base main --head release/$VERSION --title "Release $VERSION" --body "Release $VERSION PR"

