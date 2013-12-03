class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :category
      t.string :main_image
      t.text :tn_images
      t.text :tags

      t.timestamps
    end
  end
end
