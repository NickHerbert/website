# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create!(first_name: "Nicholas", :last_name => "Herbert",:provider => " ",:uid => "",:email=>"nherbe3@gmail.com",:role=>"super_admin" )
Level.delete_all
Project.delete_all
Artwork.delete_all

Level.create!(game: "Team Fortress 2",title:"Plateau",download:"linktodownload",video:"",thumbnail:"/assets/levels/plateau.jpg",background:"/assets/levels/plateauBackground.jpg",description:"A western style map that explores the use of terrain tiles as caves.",content:"This was a map i created to try and make creative use of terrain tiles.")
Level.create!(game: "Team Fortress 2",title:"Hangtown",download:"linktodownload",video:"",thumbnail:"/assets/levels/hangtown.jpg",background:"/assets/levels/hangtownBackground.jpg",description:"Man Vs Machine map built in spiral shape.",content:"A smaller Man Vs Machine map focuses on getting the player back into the action as quickly as possible. The main spawn is located in the center of the map and the robots advance around the map in a spiral shape.")
Level.create!(game: "Team Fortress 2",title:"Desctructoid",download:"linktodownload",video:"",thumbnail:"/assets/levels/destructoid.jpg",background:"/assets/levels/destructoidBackground.jpg",description:"A map built into a flying fortress.",content:"This was my first tf2 map. It needs a lot of work.")

Level.create!(game: "Left 4 Dead",title:"Coald Blood",download:"linktodownload",video:"",thumbnail:"/assets/levels/coaldBlood.jpg",background:"/assets/levels/coaldBloodBackground.jpg",description:"An abandond mine leads surviors to old ratio tower.",content:"My first campaign for left 4 dead. A 5 map campaign takes players through an old mine.")

Level.create!(game: "Left 4 Dead 2",title:"Coald Blood 2",download:"linktodownload",video:"",thumbnail:"/assets/levels/coaldBlood2.jpg",background:"/assets/levels/coaldBlood2Background.jpg",description:"A remake of the original Coald Blood.",content:"This version of coald blood is more complex than the previous version. This one offers branching story lines, a longer campaign, and a small minigame!")

Level.create!(game: "Portal",title:"The Box",download:"linktodownload",video:"",thumbnail:"/assets/levels/box.jpg",background:"/assets/levels/boxBackground.jpg",description:"A box used for slicein and dicin.",content:"I wanted to attempt to create a map that had moving walls that would allow you to put portals on. My solution ended up being to move the entire map around the walls that were stationary. This gave the illusion that the box was moving down the map when in fact the map was moving past the stationary box. ")

Level.create!(game: "Portal 2",title:"The Bigger Picture",download:"linktodownload",video:"",thumbnail:"/assets/levels/bigPicture.jpg",background:"/assets/levels/bigPictureBackground.jpg",description:"3 maps linked by little boxes",content:"I wanted to create a map that was more than a single room challenge. I wanted this map to present 3 separate rooms to which each room left the text subject with one box to aid in the next room. This would culminate in a final room that required all 3 previous boxes to prevail.")
Level.create!(game: "Portal 2",title:"Rush Down",download:"linktodownload",video:"",thumbnail:"/assets/levels/rushDown.jpg",background:"/assets/levels/rushDownBackground.jpg",description:"A vertical style timed map.",content:"This map is a timed map. what that means is once you start the test a panel of deadly lasers begins to descend on you. Therefore reaching the goal as fast as possible is of the utmost importance.")
Level.create!(game: "Portal 2",title:"Dropbox",download:"linktodownload",video:"",thumbnail:"/assets/levels/dropbox.jpg",background:"/assets/levels/dropboxBackground.jpg",description:"Small and crafty.",content:"A small map that has a small trick to finish it.")
Level.create!(game: "Portal 2",title:"Ladder",download:"linktodownload",video:"",thumbnail:"/assets/levels/ladder.jpg",background:"/assets/levels/LadderBackground.jpg",description:"A map that goes up.",content:"I love the use of vertical space when making maps. The test subject must be able to think not only horizontally but vertically to solve the puzzle.")


Level.create!(game: "Halflife 2",title:"Gulch",download:"linktodownload",video:"",thumbnail:"/assets/levels/gulch.jpg",background:"/assets/levels/gulchBackground.jpg",description:"A two fort type map.",content:"A symmetrical opposing fort style map..")
Level.create!(game: "Halflife 2",title:"Rogue Threat",download:"linktodownload",video:"",thumbnail:"/assets/levels/rogueThreat.jpg",background:"/assets/levels/rogueThreatBackground.jpg",description:"The start of a small campaign.",content:"I created the intro for a small campaign that never really got off the ground.")


Project.create!(p_type:"Professional",title:"Sourcefire Corporate Blog",content:"I was tasked with creating a blog platform that was secure as well as easy to use. To do this I created the blog using a combination of Ruby, jekyll, liquid, and github to create a site generated static content dynamically.", description:"The platform for the sourcefire corporate blog.", thumbnail:"/assets/levels/something.jpg")
Project.create!(p_type:"Professional",title:"Chalktalks blog",content:"This site was the second generation to the first blog platform. To do this I created the site using a combination of Ruby, jekyll, liquid, and github to create a site generates static sites dynamically.", description:"The platform for the chalktalks blog.", thumbnail:"/assets/levels/something.jpg")


Project.create!(p_type:"Personal",title:"Sagittarius A",content:"I wanted to create a board game that I would enjoy playing with family and friends. In addition I wanted this board game to be simple enough for people that are new to board games to pick up and enjoy and still keep experienced players interested after many play-throughs. ", description:"A board game created by me for everyone.", thumbnail:"/assets/levels/something.jpg")
Project.create!(p_type:"Personal",title:"Untitled Game",content:"I want this game to be one that even my wife will play with me. For that to happen it needs to draw on gameplay elements from games like Ticket to Ride, Pandemic, and Carcassone. ", description:"A board game created by me for everyone.", thumbnail:"/assets/levels/something.jpg")

Gallery.create!(name:"Artwork");
Artwork.create!(a_type:"2d",gallery_id:1, title:"cat",description:"A picture of a cat",thumbnail:"catThumbnail.jpg")
Artwork.create!(a_type:"3d",gallery_id:1, title:"ball",description:"A picture of a ball",thumbnail:"ballThumbnail.jpg")
Artwork.create!(a_type:"3d",gallery_id:1, title:"person",description:"A picture of a person",thumbnail:"personThumbnail.jpg")
Artwork.create!(a_type:"2d",gallery_id:1, title:"ship",description:"A picture of a ship",thumbnail:"shipThumbnail.jpg")
Artwork.create!(a_type:"2d",gallery_id:1, title:"building",description:"A picture of a building",thumbnail:"buildingThumbnail.jpg")
Artwork.create!(a_type:"3d",gallery_id:1, title:"ship",description:"A picture of a ship",thumbnail:"ship2Thumbnail.jpg")

Gallery.create!(name:"Plateau");
Artwork.create!(a_type:"level",gallery_id:2, title:"Plateau",description:"Plateau Discription here")
Gallery.create!(name:"Hangtown");
Gallery.create!(name:"Desctructoid");
Gallery.create!(name:"Coald Blood");
Gallery.create!(name:"Coald Blood 2");
Gallery.create!(name:"The Box");
Gallery.create!(name:"The Bigger Picture");
Gallery.create!(name:"Rush Down");
Gallery.create!(name:"Dropbox");
Gallery.create!(name:"Ladder");
Gallery.create!(name:"Gulch");
Gallery.create!(name:"Rogue Threat");
Gallery.create!(name:"Sagittarius A");
