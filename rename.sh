#!/bin/bash

# git log --pretty=format:"%h - %an, %ar : %s" | while read line; do
#     hash=$(echo $line | cut -f1 -d' ')
#     author=$(echo $line | cut -f2 -d' ')
#     date=$(echo $line | cut -f3 -d' ')
#     message=$(echo $line | cut -f4- -d' ')
#     echo "git commit --amend --author --allow-empty 'CharlesDerek <charlesderek177@gmail.com>' -C $hash"
#     #echo "git commit -C $hash --author 'CharlesDerek &lt;charlesderek177@gmail.com&gt;' --allow-empty"
#     #git commit --amend --author --allow-empty 'charlesderek <charlesderek177@gmail.com>'
#     #git commit --amend --author="charlesderek <charlesderek177@gmail.com>"
# done | bash

# #git config --local user.name "CharlesDerek"; git config --local user.email "charlesderek177@gmail.com"; git commit --amend -C HEAD --reset-author
# # git config --global user.name "CharlesDerek"
# # git config --global user.email "charlesderek177@gmail.com"
# # git commit --amend --reset-author --allow-empty 
# git rebase -r d1729367e0ab8fb1aca5d2bdb15a466a4efb72c5 --exec 'git commit --amend --no-edit --reset-author'

# EFFECT ALL BRANCHES:

git filter-branch --env-filter '
#OLD_EMAIL="5390421+Gronis@users.noreply.github.com"
CORRECT_NAME="CharlesDerek"
CORRECT_EMAIL="charlesderek@mrginnovations.com"
if [ "$GIT_COMMITTER_EMAIL" != "$CORRECT_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" != "$CORRECT_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
