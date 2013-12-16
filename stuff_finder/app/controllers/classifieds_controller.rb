class ClassifiedsController < ApplicationController

	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@classifieds = Classified.all
		@categories = Category.all
	end

	def new
		@classified = Classified.new
		@categories = Category.pluck(:name)
	end

	def show
		@classified = Classified.find(params[:id])
	end

	def create
		@classified = Classified.new(safe_classified_params)
		@classified.user = current_user
		@category = params[:category]

		# first_or_create - looks into table, if cat already exists returns, otherwise creates and returns
		@classified.category = Category.where(:name => @category.capitalize).first_or_create
		if @classified.save
			redirect_to classified_path(@classified)
		end
	end

	private

	def safe_classified_params
		return params.require(:classified).permit(:title, :description, :price, :image)
	end
end
