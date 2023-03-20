import requests
import sys
lang = str(sys.argv[1])
URL = "https://github.com/EvanLi/Github-Ranking/blob/master/Top100/" + lang + ".md"
page = requests.get(URL)
print(page.text)
