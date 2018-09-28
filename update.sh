#!/usr/bin/bash
echo “please input your upgration”
read content
git status
git add .
git commit -m "$content"
git pull origin master
git push origin master
