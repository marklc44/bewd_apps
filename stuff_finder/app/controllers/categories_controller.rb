class CategoriesController < ApplicationController
	def index
	end

	def show
		@category = Category.find(params[:id])
		@classifieds = Classified.where("category_id = #{@category.id}" )
	end
end
