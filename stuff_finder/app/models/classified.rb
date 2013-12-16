class Classified < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	mount_uploader :image, ImageUploader
end
