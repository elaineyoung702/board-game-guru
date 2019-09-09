from urllib import request
# import urllib3
import time

#### MUST RUN CORS ANYWHERE

def build_db():

    # for game in range(6895,10000):
    #     http = urllib3.PoolManager()
    #     req = http.request('GET', 'http://localhost:8080/https://www.boardgamegeek.com/xmlapi2/thing?type=boardgame&id=' + str(game), headers={'Origin': 'null'})
    #     response = request.urlopen(req)
    #     f = open(str(game) + ".xml", "wb")
    #     f.write(response.read())
    #     f.close()
    #     time.sleep(5)
    lst = [16992,25669,30549,31260,31481,36235,37111,37904,38378,39856,40381,40398,
        43443,43539,50381,65244,68448,70323,70919,82168,85905,97903,98229,98778,102548,
        102652,110327,123260,123540,124361,124708,124742,126163,129437,131357,133473,
        136063,139976,141648,143884,145659,146021,147666,148228,152241,155068,156546,
        156689,157969,159515,160499,161936,162886,163908,167791,169124,169786,171131,
        171233,171890,172225,172242,173346,174430,178900,181304,185154,193621,194594,
        194607,195856,198773,204053,205637,209685,217085,217372,220775,221107,224037,
        225694,228660,229491,230802,232823,233312,234396,242302,244992,245271,249821,
        254640,266192,273330]



    
    for game in lst:
        req = request.Request("http://localhost:8080/https://www.boardgamegeek.com/xmlapi2/thing?type=boardgame&id=" + str(game), headers={'Origin': 'null'})
        response = request.urlopen(req)
        f = open(str(game) + ".xml", "wb")
        f.write(response.read())
        f.close()
        time.sleep(4)

#XML Parsing. Beautiful Soup may have XML parser

build_db()