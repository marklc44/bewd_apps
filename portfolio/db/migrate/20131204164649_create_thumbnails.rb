class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.integer :project_id
      t.integer :image_id

      t.timestamps
    end
  end
end
