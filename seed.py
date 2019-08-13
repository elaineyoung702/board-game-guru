# install BeautifulSoup4
# install lxml

from bs4 import BeautifulSoup
from sqlalchemy import func
# from model import app
# from model import connect_to_db, db
from model import BoardGame


result_dict = {}


def parse_please(path):
    """"""

    with open(path) as fp:
        soup = BeautifulSoup(fp, "xml")

    bg_id = (soup.item['id']) #Board Game ID

    game_attr = soup.find("name").attrs
    name = (game_attr["value"]) # board game name (primary name)

    thumbnail = (soup.thumbnail.text) #thumbnail img link

    image = (soup.image.text) # fill img link

    description = (soup.description.text) # board game description

    playtime = (soup.playingtime['value']) #Suggested Playtime
    min_time = (soup.minplaytime['value']) #Minimum Playtime
    max_time = (soup.maxplaytime['value']) #Maximum Playtime

    year_published = (soup.yearpublished['value']) #Year Published

    min_players = (soup.minplayers['value']) # Minimum Players
    max_players = (soup.maxplayers['value']) #Maximum Players

    # Obtain Suggested Player Amount
    poll = (soup.poll)

    for result in poll.find_all('results'): #for each child in the poll parent
        num_players = result['numplayers']  #index into result child and get num_players
        best_votes = result.find('result', value='Best')    #find item with value="Best"
        num_votes = int(best_votes['numvotes']) #index into item for numvotes
        result_dict[num_votes] = num_players    #add num_votes into dict w/num_players value

    max_votes = max(result_dict)    #find highest number of votes
    suggested_players = result_dict[max_votes]  #index into dict for value for suggested num

    link_fam = soup.find_all('link')

    for item in link_fam:
        link_type = (item['type'])
        if link_type == 'boardgamedesigner':
            designer = item['value']
            break


    boardgame = BoardGame(bg_id=bg_id, bg_name=name, thumbnail_url=thumbnail, 
                image_url=image, description=description, playtime=playtime, 
                min_time=min_time, max_time=max_time, year_published=year_published, 
                min_players=min_players, max_players=max_players, 
                suggested_players=suggested_players, designer=designer)

    # print(boardgame.bg_id)
    # print(boardgame.bg_name)
    # print(boardgame.thumbnail_url)
    # print(boardgame.image_url)
    # print(boardgame.description)
    # print(boardgame.playtime)
    # print(boardgame.min_time)
    # print(boardgame.max_time)
    # print(boardgame.year_published)
    # print(boardgame.min_players)
    # print(boardgame.max_players)
    # print(boardgame.suggested_players)
    # print(boardgame.designer)


    # db.session.add(boardgame)




parse_please("3.xml")


# Board_Game(thumbnail_url=thumbnail, ...etc)
#db.session.add(...)
#db.session.commit


#db.session.commit

# if __name__ == "__main__":
#      connect_to_db(app)
#      db.create_all()