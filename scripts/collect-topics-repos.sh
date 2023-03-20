#!/bin/bash
# first argument $1 represents number of repos per topic to query (e.g., ./collect-topcs-repos.sh 1000)
# topics list
topics=("3D" "Ajax" "Algorithm" "Amp" "Android" "Angular" "Ansible" "API" "Arduino" "ASPNET" "Atom" "Awesome" "AWS" "Azure" "Babel" "Bash" "Bitcoin" "Bootstrap" "Bot" "C" "Chrome" "Chrome-extension" "CLI" "Clojure" "Code-quality" "Code-review" "Compiler" "Continuous-integration" "COVID-19" "CPP" "Cryptocurrency" "Crystal" "Csharp" "CSS" "Data-structures" "Data-visualization" "Database" "Deep-learning" "Dependency-management" "Deployment" "Django" "Docker" "Documentation" "DotNET" "Electron" "Elixir" "Emacs" "Ember" "Emoji" "Emulator" "ESLint" "Ethereum" "Express" "Firebase" "Firefox" "Flask" "Font" "Framework" "FrontEnd" "Game-engine" "Git" "GitHub-API" "Go" "Google" "Gradle" "GraphQL" "Gulp" "Hacktoberfest" "Haskell" "Homebrew" "Homebridge" "HTML" "HTTP" "Icon-font" "iOS" "IPFS" "Java" "JavaScript" "Jekyll" "jQuery" "JSON" "Julia" "Jupyter-Notebook" "Koa" "Kotlin" "Kubernetes" "Laravel" "LaTeX" "Library" "Linux" "Localization" "Lua" "Machine-learning" "macOS" "Markdown" "Mastodon" "Material-Design" "MATLAB" "Maven" "Minecraft" "Mobile" "Monero" "MongoDB" "Mongoose" "Monitoring" "MvvmCross" "MySQL" "NativeScript" "Nim" "NLP" "NodeJS" "NoSQL" "npm" "Objective-C" "OpenGL" "Operating-system" "P2P" "Package-manager" "Parsing" "Perl" "Phaser" "PHP" "PICO-8" "Pixel-Art" "PostgreSQL" "Project-management" "Publishing" "PWA" "Python" "Qt" "R" "Rails" "Raspberry-Pi" "Ratchet" "React" "React-Native" "ReactiveUI" "Redux" "REST-API" "Ruby" "Rust" "Sass" "Scala" "scikit-learn" "SDN" "Security" "Server" "Serverless" "Shell" "Sketch" "SpaceVim" "Spring-Boot" "SQL" "Storybook" "Support" "Swift" "Symfony" "Telegram" "Tensorflow" "Terminal" "Terraform" "Testing" "Twitter" "TypeScript" "Ubuntu" "Unity" "Unreal-Engine" "Vagrant" "Vim" "Virtual-reality" "Vue" "Wagtail" "Web-Components" "WebApp" "Webpack" "Windows" "WordPlate" "WordPress" "Xamarin" "XML")
for topic in "${topics[@]}"; do
  echo $topic
  # get top repos per topic and store in ./<num>-repos/<topic>-repos.txt
  gh search repos --topic "$topic" -L $1 > repos.txt
  cut -f1 repos.txt > $1-repos/$topic-repos.txt
  rm repos.txt
  # get info about each repo (e.g., workflows and security policies)
  ./get-info.sh $1 "$topic"
done

