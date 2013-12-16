class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :uri
      t.text :tn_uri
      t.integer :project_id

      t.timestamps
    end
  end
end
