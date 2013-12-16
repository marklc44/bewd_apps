class ChangeTnImageInProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :tn_images, :integer
  end
end
