class Level < ActiveRecord::Base
  has_many :galleries
  attr_accessible :content, :description, :download, :game, :thumbnail, :title, :background, :video

  #add games here to have them show up in the drop down lists
  GAMES = ["Team Fortress 2", "Portal", "Portal 2", "Left 4 Dead", "Left 4 Dead 2", "Halflife 2"]
end
