from bs4 import BeautifulSoup
from sqlalchemy import func
# from model import app
from model import connect_to_db, db
from model import BoardGame

from server import app

import html


def parse_please(path):
    """Parsing board game XML files and building database."""

    with open(path) as fp:
        soup = BeautifulSoup(fp, "xml")

    if soup.item is None:
        print("Skipping...")
        return

    bg_id = (soup.item['id']) #Board Game ID

    game_attr = soup.find("name").attrs
    name = (game_attr["value"]) # board game name (primary name)

    thumbnail = (soup.thumbnail.text) #thumbnail img link

    image = (soup.image.text) # fill img link

    description = html.unescape(soup.description.text) # board game description

    playtime = (soup.playingtime['value']) #Suggested Playtime
    min_time = (soup.minplaytime['value']) #Minimum Playtime
    max_time = (soup.maxplaytime['value']) #Maximum Playtime

    year_published = (soup.yearpublished['value']) #Year Published

    min_players = (soup.minplayers['value']) # Minimum Players
    max_players = (soup.maxplayers['value']) #Maximum Players

    # Obtain Suggested Player Amount
    result_dict = {}
    poll = (soup.poll)

    for result in poll.find_all('results'): #for each child in the poll parent
        num_players = result['numplayers']  #index into result child and get num_players
        if '+' in num_players:  #remove suggested player of number+
            break
        best_votes = result.find('result', value='Best')    #find item with value="Best"
        num_votes = int(best_votes['numvotes']) #index into item for numvotes
        result_dict[num_votes] = num_players    #add num_votes into dict w/num_players value

    max_votes = max(result_dict)    #find highest number of votes
    suggested_players = result_dict[max_votes]  #index into dict for value for suggested num

    # if "+" not in suggested_players:
    #     if int(suggested_players) < int(min_players):
    #         suggested_players = min_players

    # Obtain Board Game Designer
    link_fam = soup.find_all('link')    #find all link tags

    for item in link_fam:   #for each item with link tag
        link_type = (item['type'])  #index type tag within link tag and set variable
        if link_type == 'boardgamedesigner':    #search each type tag to find match
            designer = item['value'] #set value to designer variable
            break


    boardgame = BoardGame(bg_id=bg_id, bg_name=name, thumbnail_url=thumbnail, 
                image_url=image, description=description, playtime=playtime, 
                min_time=min_time, max_time=max_time, year_published=year_published, 
                min_players=min_players, max_players=max_players, 
                suggested_players=suggested_players, designer=designer)

    db.session.add(boardgame)
    db.session.commit()

    print(f'Successfully added: {boardgame}')

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




if __name__ == "__main__":

    connect_to_db(app)
    db.create_all()

    for i in range (91,100):
        parse_please(f"{i}.xml")




