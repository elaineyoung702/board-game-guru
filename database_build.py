from urllib import request
import time

def build_db():
    
    for game in range(38,10000):
        req = request.Request("http://localhost:8080/https://www.boardgamegeek.com/xmlapi2/thing?type=boardgame&id=" + str(game), headers={'Origin': 'null'})
        response = request.urlopen(req)
        f = open(str(game) + ".xml", "wb")
        f.write(response.read())
        f.close()
        time.sleep(5)

#XML Parsing. Beautiful Soup may have XML parser

build_db()