#!/bin/bash

echo "MERGE BRANCH"

# Only auto merge develop branch for now
if [ "$TRAVIS_BRANCH" != "develop" ]; then
    exit 0;
fi

export GIT_COMMITER_EMAIL='johan.viklund@nbis.se'
export GIT_COMMITER_NAME='Johan Viklund'

git fetch --depth=50 origin refs/heads/master:master
git checkout master
git merge "$TRAVIS_COMMIT" || exit
echo "MERGED"
git push -q https://$GITHUB_TOKEN:x-oauth-basic@github.com/NBISweden/K9-WGS-Pipeline.git HEAD:master
