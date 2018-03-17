#!/bin/bash

# Only auto merge develop branch for now
if [ "$TRAVIS_BRANCH" != "develop" ]; then
    exit 0;
fi

export GIT_COMMITER_EMAIL='johan.viklund@nbis.se'
export GIT_COMMITER_NAME='Johan Viklund'

git merge origin/master || exit
echo "MERGED"
#git push -q https://$GITHUB_TOKEN:x-oauth-basic@github.com/NBISweden/K9-WGS-Pipeline.git HEAD:master
