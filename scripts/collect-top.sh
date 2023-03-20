#!/bin/sh
# top 50 pages
for i in {1..51}; do
  # scrape from https://gitstar-ranking.com/repositories
  python3 top-scrape.py $i > out.txt
  while read line; do
    # common string with repo
    sub="</a><a class=\"list-group-item paginated_item\" href"
    if [[ $line == *$sub* ]]; then
      repo=${line:53}
      repo=${repo%%\"*}
      echo $repo >> top-repos.txt
    fi
  done < out.txt
done
