class StoriesController < ApplicationController

	before_action :authenticate_user!, :only => [:new, :create]
	
	def index
		if params[:q].present?
			@stories = Story.search_for(params[:q])
		else
			@stories = Story.all
		end
	end

	# don't really need this cuz movie link points off site
	def show
		@story = Story.find(params[:id])
		@page_title = @story.title
	end

	def edit
		@page_title = "Edit this story"
		@story = Story.find(params[:id])
	end

	def create
		@story = Story.new(safe_story_params)
		logger.info(@story.inspect)

		if @story.save
			redirect_to root_path
		else
			# will render form again with any field values still intact
			render :new
		end
	end

	def new
		@page_title = "Create a new Story"
		@story = Story.new
	end

	private

	def safe_story_params
		return params.require(:story).permit(:title, :category, :link, :upvotes)
	end

end
