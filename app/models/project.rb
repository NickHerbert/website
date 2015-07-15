class Project < ActiveRecord::Base
  attr_accessible :description, :thumbnail, :title, :p_type, :content
  has_many :posts


  PROJECTTYPES = %w[Professional Personal]
end
