#!/bin/bash

set -e

repoName=$1

while [ -z "$repoName" ] 
do
  echo "Provide the name of the Repository"
  read -r -p "Repository Name: " repoName
done

echo "# $repoName" >> README.md

git init -b main
git add .
git commit -m "initial commit"

GH_REPO_URL=$(gh repo create "$repoName" --public)

git remote add origin "$GH_REPO_URL"
git push -u origin main

echo "Script Finished"
