class ProjectsController < ApplicationController
	def index
		@page_title = "Projects"

		@cats = Project.get_filters

		if params[:filter].present?
			@projects = Project.filter_for(params[:filter])
		else
			@projects = Project.all
		end
	end

	def new
	end

	def create
	end

	def edit
	end

	def show	
		@project = Project.find(params[:id])
		@page_title = "Projects"
		@subtitle = @project.title 
	end

	def update
	end

	def destroy
	end
end
