from bs4 import BeautifulSoup
from sqlalchemy import func
# from model import app
from model import connect_to_db, db
from model import BoardGame, User, Tag

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
    bg_name = (game_attr["value"]) # board game name (primary name)

    try:
        thumbnail_url = (soup.thumbnail.text) #thumbnail img link
        image_url = (soup.image.text) # fill img link
    except AttributeError:
        thumbnail_url = '/static/image/placeholder.png'
        image_url = '/static/image/placeholder.png'

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

    if len(result_dict) == 1:
        print("No votes.")
        return

    try:
        max_votes = max(result_dict)    #find highest number of votes
        suggested_players = result_dict[max_votes]  #index into dict for value for suggested num
    except ValueError:
        print("No suggested players. Skipping...")
        return

    # Obtain Board Game Designer and Publisher
    link_fam = soup.find_all('link')    #find all link tags
    designer = 'Uncredited'
    publisher = 'Uncredited'

    for item in link_fam:   #for each item with link tag
        link_type = (item['type'])  #index type tag within link tag and set variable
        if link_type == 'boardgamepublisher':
            publisher = item['value']
        if link_type == 'boardgamedesigner':    #search each type tag to find match
            designer = item['value'] #set value to designer variable
        if publisher != 'Uncredited' and designer != 'Uncredited':
            break
        
        
    boardgame = BoardGame(bg_id=bg_id, bg_name=bg_name, thumbnail_url=thumbnail_url, 
                image_url=image_url, description=description, playtime=playtime, 
                min_time=min_time, max_time=max_time, year_published=year_published, 
                min_players=min_players, max_players=max_players, 
                suggested_players=suggested_players, designer=designer, publisher=publisher)

    db.session.add(boardgame)
    db.session.commit()

    print(f'Successfully added: {boardgame}')


def instantiate_tags():
    """Instantiating Predetermined Tags/Categories for Board Games."""

    tag = Tag(tag_name="Competitive", tag_description="Players play against each other and compete to win via direct conflict")
    db.session.add(tag)
    
    tag = Tag(tag_name="Cooperative", tag_description="Players usually play against the game and work together towards the same goal")
    db.session.add(tag)
    
    tag = Tag(tag_name="Eurogame", tag_description="Players compete to win with indirect conflict, emphasizing individual development and comparative achievement")
    db.session.add(tag)

    tag = Tag(tag_name="Light Strategy", tag_description="Easy strategy")
    db.session.add(tag)
    
    tag = Tag(tag_name="Medium Strategy", tag_description="Medium strategy")
    db.session.add(tag)
    
    tag = Tag(tag_name="Heavy Strategy", tag_description="Heavy strategy - not for the lighthearted!")
    db.session.add(tag)

    tag = Tag(tag_name="Classic", tag_description="Classic Board Game")
    db.session.add(tag)

    tag = Tag(tag_name="Family", tag_description="Good for kids and parents of all ages")
    db.session.add(tag)
    
    tag = Tag(tag_name="Mature/Adult", tag_description="Suggested for mature audiences only")
    db.session.add(tag)

    tag = Tag(tag_name="Legacy", tag_description="Legacy games incoporate a changing board and ongoing story changes")
    db.session.add(tag)
    
    tag = Tag(tag_name="Expansion", tag_description="Expansion of an original game")
    db.session.add(tag)

    db.session.commit()



##############################################################

if __name__ == "__main__":
    import sys

    connect_to_db(app)
    db.create_all()
    instantiate_tags()

    try:
        if sys.argv[1] == '--create-user':
            db.session.add(User(name='TEST', email='test@test.com', password='test'))
            db.session.commit()
    except IndexError:       
        for i in range (1,5701):
            parse_please(f"{i}.xml")


# 1 - 5701
# 5703, 11670



