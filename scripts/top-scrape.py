import requests
import sys

URL = "https://gitstar-ranking.com/repositories?page=" + str(sys.argv[1])
page = requests.get(URL)

print(page.text)
