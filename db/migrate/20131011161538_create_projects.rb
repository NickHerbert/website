class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :p_type
      t.string :title
      t.text   :content
      t.string :description
      t.string :thumbnail

      t.timestamps
    end
  end
end
