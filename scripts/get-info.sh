#!/bin/bash
# first argument (directory source): repo source directory
# second argument (repo source): repo name 
# technique: parse input from file ./<directory source>-repos/<repo source>-repos.txt
# e.g., ./get-info.sh "lang" "Python" would get input from: ./lang-repos/Python-repos.txt
# output: ./<directory source>-output/<repo source>-info.txt
echo "author_repo,wf_contents,security_policy" > $1-output/$2-info.csv
while read line; do
  repo="${line%% *}"
  # get top 1000 workflows
  wresp="$(gh workflow list -R $repo -a -L 1000)"
  # preserve CSV format
  wresp="${wresp//[$'\t\r\n,']/' '}"
  # get and format security policies to as friendly as friendly as possible (could use some work)
  cresp=$(curl -s https://github.com/$repo/security/policy | html2text | sed -n '/TY/,$p' | sed -n '/Inc./q;p' | sed 's/[^a-z  A-Z]//g' | head -n-1 | tail -n+3)
  # preserve CSV format 
  cresp="${cresp//[$'\t\r\n,']/' '}"
  echo "$repo,$wresp,$cresp" >> $1-output/$2-info.csv
done < $1-repos/$2-repos.txt
