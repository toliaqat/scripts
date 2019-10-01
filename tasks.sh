#!/bin/bash -x
#
# Create TODO task as a pull request!
# Usage: ./tasks.sh Get the milk!
#
msg=$*
cd ~/airlab/repos/tasks/
branch="$(echo $msg | tr ' ' '-')"
git checkout master
git checkout -b $branch
echo $msg >> README.md
git add -u .
git commit -m "$msg"
url="$(git push 2>&1 | grep 'tasks\/pull' | awk '{print $2}')"
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $url
