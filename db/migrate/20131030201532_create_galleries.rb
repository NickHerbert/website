class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer "level_id"
      t.string :name
      t.timestamps
    end
    add_index "galleries", :level_id
  end
end
