class Artwork < ActiveRecord::Base

  attr_accessible :gallery_id,:description, :thumbnail, :a_type, :title, :image
  belongs_to :gallery
  mount_uploader :image, ImageUploader

end
