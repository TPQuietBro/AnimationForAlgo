#!/usr/bin/bash
git status
git add .
git commit -m "update"
git pull origin master
git push origin master
