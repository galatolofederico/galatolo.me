#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: ./update-repo.sh <repo-url>"
    exit
fi

url="$1"
name=$(echo "$url" | rev | cut -d'/' -f1 | rev )

if [ ! -d "repositories" ]; then mkdir "repositories"; fi

if [ -d "repositories/$name" ]; then
    (
        cd "repositories/$name" || exit
        default_branch=$(git remote show "$url" | grep 'HEAD branch' | cut -d' ' -f5)
        git pull origin "$default_branch";
    )
else
    git clone "$url" "repositories/$name";
fi