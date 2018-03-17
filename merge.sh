#!/bin/bash
set -e

# Only auto merge develop branch and non-PRs
if [ "$TRAVIS_BRANCH" != "develop" -o "$TRAVIS_PULL_REQUEST" != "false" ]; then
    exit 0;
fi

git config user.email "johan.viklund@nbis.se"
git config user.name "Travis CI"

git fetch --depth=50 origin refs/heads/master:master
git checkout master
git merge --no-ff "$TRAVIS_COMMIT"
git push -q https://$GITHUB_TOKEN:x-oauth-basic@github.com/viklund/test-travis-ci.git master:refs/heads/master
