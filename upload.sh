#!/bin/bash

cd ~/Documents/SocialMediaPosts

# Ask for commit message
read -p "Commit message: " msg

git add .
git commit -m "$msg"
git push origin main

echo "✔ Files uploaded successfully!"
