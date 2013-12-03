class PostsController < ApplicationController
	def index
		@page_title = "Blog"

		@cats = Post.get_filters

		if params[:filter].present?
			@posts = Post.filter_for(params[:filter])
		else
			@posts = Post.all
		end
	end

	def new
	end

	def create
	end

	def edit
	end

	def show	
		@post = Post.find(params[:id])
		@page_title = @post.titlele 
	end

	def update
	end

	def destroy
	end

	private

	def safe_project_params
		return params.require(:posts).permit(:title, :description, :category, :main_image, :tn_images, :tags, :featured)
	e
end
