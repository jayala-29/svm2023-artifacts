#!/bin/bash
echo "author_repo,wf_contents,security_policy" > top-info.csv
# same as get-info except specific to produce direct output in curr directory using `top-repos.txt`
while read line; do
  repo="${line%% *}"
  wresp="$(gh workflow list -R $repo -a -L 1000)"
  wresp="${wresp//[$'\t\r\n,']/' '}"
  cresp=$(curl -s https://github.com/$repo/security/policy | html2text | sed -n '/TY/,$p' | sed -n '/Inc./q;p' | sed 's/[^a-z  A-Z]//g' | head -n-1 | tail -n+3)
  cresp="${cresp//[$'\t\r\n,']/' '}"
  echo "$repo,$wresp,$cresp" >> top-info.csv
done < top-repos.txt
