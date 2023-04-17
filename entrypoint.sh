#!/bin/sh -l

codeql database analyze --format=sarif-latest --output=./ query
echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT