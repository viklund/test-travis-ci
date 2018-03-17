#!/bin/bash

echo "MERGE BRANCH"

# Only auto merge develop branch for now
if [ "$TRAVIS_BRANCH" != "develop" ]; then
    exit 0;
fi

export GIT_COMMITER_EMAIL='johan.viklund@nbis.se'
export GIT_COMMITER_NAME='Travis CI'


git fetch --depth=50 origin refs/heads/master:master
git checkout master
git merge --no-ff "$TRAVIS_COMMIT" || exit
echo "MERGED"
git fetch
PAGER=cat git log --graph --oneline --decorate --all
git push -q https://$GITHUB_TOKEN:x-oauth-basic@github.com/viklund/test-travis-ci.git master:refs/heads/master
