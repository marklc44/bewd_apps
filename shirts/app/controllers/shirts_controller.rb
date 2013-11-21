class ShirtsController < ApplicationController
	def index
		if params[:q].present?
			@shirts = Shirt.search_for(params[:q])
		else
			@shirts = Shirt.all.order("created_at DESC")
		end
	end

	def new
		@shirt = Shirt.new
	end

	def create
		@shirt = Shirt.new(safe_shirt_params)
		logger.info(@shirt.inspect) 

		@shirt.save
		redirect_to root_path
	end

	def show
		@shirt = Shirt.find(params[:id])
	end

	def edit
		@shirt = Shirt.find(params[:id])
	end

	def update
		@shirt = Shirt.find(params[:id])
		@shirt.update(safe_shirt_params)

		redirect_to shirt_path(@shirt)
	end

	def destroy
		@shirt = Shirt.find(params[:id])
		@shirt.destroy

		redirect_to root_path
	end

	private

	def safe_shirt_params
		return params.require(:shirt).permit(:name, :description, :image)
	end
end
