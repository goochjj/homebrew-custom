#!/bin/bash

set -e
git fetch origin
git fetch dok
git checkout master
git rebase dok/wizmods
git rebase origin/master
git push dok origin/master:master +master:wizmods

