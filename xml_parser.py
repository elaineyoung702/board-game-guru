# install BeautifulSoup4
# install lxml

from bs4 import BeautifulSoup

result_dict = {}

def parse_please(path):
    """"""

    with open(path) as fp:
        soup = BeautifulSoup(fp, "xml")


    game_attr = soup.find("name").attrs
    name = (game_attr["value"]) # board game name (primary name)

    thumbnail = (soup.thumbnail) #thumbnail img link

    image = (soup.image) # fill img link

    description = (soup.description) # board game description

    bg_id = (soup.item['id']) #Board Game ID

    year_published = (soup.yearpublished) #Year Published

    min_players = (soup.minplayers) # Minimum Players

    max_players = (soup.maxplayers) #Maximum Players

    playtime = (soup.playingtime) #Suggested Playtime

    min_playtime = (soup.minplaytime) #Minimum Playtime

    max_playtime = (soup.maxplaytime) #Maximum Playtime

    for result in poll.find_all('results'):
        num_players = result['numplayers']
        best_votes = result.find('result', value='Best')
        num_votes = int(best_votes['numvotes'])
        result_dict[num_votes] = num_players

    max_votes = max(result_dict)
    suggest_players = result_dict[max_votes]

    # Board_Game(thumbnail_url=thumbnail, ...etc)
    #db.session.add(...)
    #db.session.commit


parse_please("3.xml")

# ######################################

# print(soup.poll['totalvotes']) #Total Votes on suggested players
# print("~~~~~~~~~~~~~~~~~~~~")

# print(soup.results['numplayers']) # 
# print("***********")
# results = (soup.find_all("results")) # 
# print("***********")

# new_list =[]

# if "Best" in results:
#     new_list.append("yay")

# print()
# print("***********")
# # print(soup.results[3]) 
# # print("***********")