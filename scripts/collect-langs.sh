#!/bin/sh
# langs
langs=("ActionScript" "C" "CPP" "CSS" "CSharp" "Clojure" "CoffeeScript" "DM" "Dart" "Elixir" "Go" "Groovy" "HTML" "Haskell" "Java" "JavaScript" "Julia" "Kotlin" "Lua" "MATLAB" "Objective-C" "PHP" "Perl" "PowerShell" "Python" "R" "Ruby" "Rust" "Scala" "Shell" "Swift" "TeX" "TypeScript" "Vim-script")
# repo prefix
prefix="<td><a href=\"https://github.com/"
for lang in "${langs[@]}"; do
  # send raw scraped data to out.txt from https://github.com/EvanLi/Github-Ranking/blob/master/Top100
  python3 scrape.py "$lang" > out.txt
  while read line; do
    if [[ "$line" = *"$prefix"* ]]; then
      stripped=${line:32}
      stripped=${stripped%\"*}
      # send output to ./lang-repos/<lang>-repos.txt
      echo $stripped >> lang-repos/$lang-repos.txt
    fi
  done < out.txt
  rm out.txt
  # perform analyses (e.g., collect workflows and security policies)
  ./get-info.sh lang $lang
done
