class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :game
      t.string :title
      t.string :description
      t.string :thumbnail
      t.string :download
      t.string :background
      t.string :video
      t.text :content

      t.timestamps
    end
  end
end
