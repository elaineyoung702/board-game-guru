from bs4 import BeautifulSoup
from sqlalchemy import func
# from model import app
from model import connect_to_db, db
from model import BoardGame, User, Tag, BgTag

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

    comp = Tag(tag_name="Competitive",
                tag_description="Players play against each other and compete to \
                win via direct conflict")
    coop = Tag(tag_name="Cooperative",
                tag_description="Players play against the game and work together \
                towards the same goal")
    euro = Tag(tag_name="Eurogame",
                tag_description="Players compete to win with indirect conflict, \
                emphasizing individual development and comparative achievement")
    light = Tag(tag_name="Light Strategy",
                tag_description="Easy strats")   
    heavy = Tag(tag_name="Heavy Strategy",
                tag_description="Not for the lighthearted!")
    classic = Tag(tag_name="Classic",
                tag_description="Old School Games")
    family = Tag(tag_name="Family",
                tag_description="Good for kids and parents of all ages")
    adult = Tag(tag_name="Mature/Adult",
                tag_description="For mature audiences only")
    hide = Tag(tag_name="Hidden Role",
                tag_description="Who are the good guys? Who are badguiz?")
    legacy = Tag(tag_name="Legacy",
                tag_description="Game incorporates a changing board and ongoing \
                story plotline")
    exp = Tag(tag_name="Expansion",
                tag_description="Branch off of an original game")
    port = Tag(tag_name="Easily Portable",
                tag_description="Easy to take on the go!")


    db.session.add_all([comp, coop, euro, light, heavy, classic, family, adult,
                        legacy, exp, port, hide])
    db.session.commit()


BG_DB_LIST = [13,15,34,74,163,171,188,320,811,822,859,891,1198,1258,1294,1297,
                1301,1339,1406,1501,1927,2001,2002,2223,2243,2281,2407,2452,2453,
                2655,2679,2719,2921,2957,3076,3837,3955,4143,4991,5048,5432,5522,
                5839,6541,7336,7927,9209,9220,9963,10361,10547,10681,11542,16992,
                25669,30549,31260,31481,36235,37111,37904,38378,39856,40381,40398,
                43443,43539,50381,65244,68448,70323,70919,82168,85905,97903,98229,
                98778,102548,102652,110327,123260,123540,124361,124708,124742,126163,
                129437,131357,133473,136063,139976,141648,143884,145659,146021,
                147666,148228,152241,155068,156546,156689,157969,159515,160499,
                161936,162886,163908,167791,169124,169786,171131,171233,171890,
                172225,172242,173346,174430,178900,181304,185154,193621,194594,
                194607,195856,198773,204053,205637,209685,217085,217372,220775,
                221107,224037,225694,228660,229491,230802,232823,233312,234396,
                242302,244992,245271,249821,254640,266192,273330]



def instantiate_test_users():
    """Create fake user data for demonstration of tags."""

    elaine = User(name="Elaine", email="elaine@test.com", password="test")
    jack = User(name="Jack", email="jack@test.com", password="test")
    vonny = User(name="Vonny", email="vonny@test.com", password="test")
    romain = User(name="Romain", email="romain@test.com", password="test")
    ashley = User(name="Ashley", email="ashley@test.com", password="test")
    jay = User(name="Jay", email="jay@test.com", password="test")
    meggie = User(name="Meggie", email="meggie@test.com", password="test")
    jeff = User(name="Jeff", email="jeff@test.com", password="test")
    chance = User(name="Chance", email="chance@test.com", password="test")
    natalie = User(name="Natalie", email="natalie@test.com", password="test")
    shadi = User(name="Shadi", email="shadi@test.com", password="test")
    alyssa = User(name="Alyssa", email="alyssa@test.com", password="test")
    danners = User(name="Danners", email="danners@test.com", password="test")
    steph = User(name="Steph", email="steph@test.com", password="test")
    kiko = User(name="kiko", email="kiko@test.com", password="test")
    cj = User(name="CJ", email="cj@test.com", password="test")


    db.session.add_all([elaine, jack, vonny, romain, ashley, jay, jeff, chance, 
                        natalie, shadi, alyssa, meggie, steph, kiko, cj])

    lst = ["Mario Speedwagon","Petey Cruiser","Anna Sthesia","Paul Molive",
            "Anna Mull","Gail Forcewind","Paige Turner","Bob Frapples",
            "Walter Melon","Nick R. Bocker","Barb Ackue","Buck Kinnear","Greta Life",
            "Ira Membrit","Shonda Leer","Brock Lee","Maya Didas","Pete Sariya",
            "Monty Carlo","Sal Monella","Sue Vaneer","Cliff Hanger","Barb Dwyer",
            "Terry Aki","Cory Ander","Robin Banks","Jimmy Changa","Barry Wine",
            "Wilma Mumduya","Buster Hyman","Poppa Cherry","Zack Lee","Don Stairs",
            "Saul T. Balls","Peter Pants","Hal Appeno ","Otto Matic","Moe Fugga",
            "Graham Cracker","Tom Foolery","Al Dente","Bud Wiser","Polly Tech",
            "Holly Graham","Frank N. Stein","Cam L. Toe","Pat Agonia","Tara Zona",
            "Barry Cade","Phil Anthropist ","Marvin Gardens","Phil Harmonic ",
            "Arty Ficial","Will Power","Donatella Nobatti","Juan Annatoo",
            "Stew Gots","Anna Rexia","Bill Emia","Curt N. Call","Max Emum",
            "Minnie Mum","Bill Yerds","Hap E. Birthday","Matt Innae","Polly Science",
            "Tara Misu","Ed U. Cation","Gerry Atric","Kerry Oaky","Midge Itz",
            "Gabe Lackmen","Mary Christmas","Dan Druff","Jim Nasium","Angie O. Plasty",
            "Ella Vator","Sal Vidge","Bart Ender","Artie Choke","Hans Olo",
            "Hugh Briss","Gene Poole","Ty Tanic","Manuel Labor","Lynn Guini",
            "Claire Voyant","Peg Leg","Jack E. Sack","Marty Graw","Ash Wednesday",
            "Olive Yu","Gene Jacket","Tom Atoe","Doug Out","Sharon Needles",
            "Beau Tie","Serj Protector"]

    for name in lst:
        email = name.replace(" ", "_")
        email = email + "@test.com"
        user = User(name=name, email=email, password="test")
        db.session.add(user)
        db.session.commit()

    elaine_favs = [233312, 234396, 198773, 171233, 161936, 143884, 136063, 1198]

    for bg_id in elaine_favs:
        new_fav = elaine.add_fav(BoardGame.query.filter(BoardGame.bg_id==bg_id).one())

    for i in range(1, 80):
        bgtag = BgTag(user_id=i, bg_id=161936, tag_id=2)
        bgtag1 = BgTag(user_id=i, bg_id=161936, tag_id=9)
        bgtag2 = BgTag(user_id=i, bg_id=233312, tag_id=2)
        bgtag3 = BgTag(user_id=i, bg_id=233312, tag_id=4)
        bgtag4 = BgTag(user_id=i, bg_id=233312, tag_id=7)
        bgtag5 = BgTag(user_id=i, bg_id=37111, tag_id=1)
        bgtag6 = BgTag(user_id=i, bg_id=37111, tag_id=2)
        bgtag7 = BgTag(user_id=i, bg_id=37111, tag_id=12)
        bgtag8 = BgTag(user_id=i, bg_id=1198, tag_id=1)
        bgtag9 = BgTag(user_id=i, bg_id=1198, tag_id=6)
        bgtag10 = BgTag(user_id=i, bg_id=1198, tag_id=7)
        bgtag11 = BgTag(user_id=i, bg_id=37111, tag_id=11)

        db.session.add_all([bgtag, bgtag1, bgtag2, bgtag3, bgtag4, bgtag5, bgtag6,
                            bgtag7, bgtag8, bgtag9, bgtag10, bgtag11])
        
    db.session.commit()


##############################################################

if __name__ == "__main__":

    connect_to_db(app)
    db.create_all()

    for i in BG_DB_LIST:
        parse_please(f"{i}.xml")

    instantiate_tags()

    instantiate_test_users()




# 1 - 5701
# 5703, 11670



