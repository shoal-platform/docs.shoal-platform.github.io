#!/bin/bash

# Parse -m flag
MESSAGE=""
while getopts "m:" opt; do
  case $opt in
    m) MESSAGE="$OPTARG" ;;
    *) echo "Usage: ./deploy.sh -m \"your commit message\""; exit 1 ;;
  esac
done

# Error if no message
if [ -z "$MESSAGE" ]; then
  echo "Error: commit message required. Usage: ./deploy.sh -m \"your commit message\""
  exit 1
fi

# Activate venv and build
source myenv/bin/activate
mkdocs build

# Deploy to live repo
cd ../shoal-platform.github.io
git pull
cp -r ../docs.shoal-platform.github.io/site/* .
git add .
git commit -m "$MESSAGE"
git push

echo "Deployed: $MESSAGE"
