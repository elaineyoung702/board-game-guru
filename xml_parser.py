# install BeautifulSoup4
# install lxml

from bs4 import BeautifulSoup

with open("3.xml") as fp:
    soup = BeautifulSoup(fp, "xml")

game_attr = soup.find("name").attrs
print(game_attr["value"]) # board game name (primary name)

# print(soup.thumbnail) #thumbnail img link

# print(soup.image) # fill img link

# print(soup.description) # board game description

print(soup.item['id']) #Board Game ID
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
# print(soup.yearpublished) #Year Published

# print(soup.minplayers) # Minimum Players

# print(soup.maxplayers) #Maximum Players

# print(soup.playingtime) #Suggested Playtime

# print(soup.minplaytime) #Minimum Playtime

# print(soup.maxplaytime) #Maximum Playtime

######################################

# print(soup.poll['totalvotes']) #Total Votes on suggested players


# print(soup.poll) # 
# print("***********")
# print(soup.results) # 
# print("***********")
# print()
# print("***********")
# print() 
# print("***********")