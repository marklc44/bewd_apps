class MoviesController < ApplicationController
	def index
		if params[:q].present?
			@movies = Movie.search_for(params[:q])
		else
			@movies = Movie.all
		end
	end

	def new
		@page_title = "Create a new movie"
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(safe_movie_params)
		logger.info(@movie.inspect)

		@movie.save
		redirect_to root_path
	end

	def show
		@page_title = ""
		@movie = Movie.find(params[:id])
	end

	def edit
		@page_title = "Edit the movie"
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update(safe_movie_params)

		redirect_to movie_path(@movie)
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		
		redirect_to root_path
	end
	private

	def safe_movie_params
		return params.require(:movie).permit(:title, :description, :year_released)
	end
end
