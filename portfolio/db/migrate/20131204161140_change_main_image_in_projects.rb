class ChangeMainImageInProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :main_image, :integer
  end
end
