from urllib import request
# import urllib3
import time

def build_db():

    # for game in range(6895,10000):
    #     http = urllib3.PoolManager()
    #     req = http.request('GET', 'http://localhost:8080/https://www.boardgamegeek.com/xmlapi2/thing?type=boardgame&id=' + str(game), headers={'Origin': 'null'})
    #     response = request.urlopen(req)
    #     f = open(str(game) + ".xml", "wb")
    #     f.write(response.read())
    #     f.close()
    #     time.sleep(5)
    
    for game in range(6895,14000):
        req = request.Request("http://localhost:8080/https://www.boardgamegeek.com/xmlapi2/thing?type=boardgame&id=" + str(game), headers={'Origin': 'null'})
        response = request.urlopen(req)
        f = open(str(game) + ".xml", "wb")
        f.write(response.read())
        f.close()
        time.sleep(4)

#XML Parsing. Beautiful Soup may have XML parser

build_db()