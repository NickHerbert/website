class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.integer :gallery_id
      t.string :a_type
      t.string :title
      t.string :description
      t.string :thumbnail
      t.string :image

      t.timestamps
    end
  end
end
