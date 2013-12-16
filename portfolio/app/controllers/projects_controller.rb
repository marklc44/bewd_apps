class ProjectsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :destroy]

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
		@page_title = "Create a new project"
		@project = Project.new
	end

	def create
		@project = Project.new(safe_project_params)

		if @project.save
			redirect_to projects_path
		else
			render :new
		end
	end

	def edit
		@project = Project.find(params[:id])
		@page_title = "Edit the project"
		@subtitle = @project.title
	end

	def show	
		@project = Project.find(params[:id])
		@page_title = "Projects"
		@subtitle = @project.title
		@main_image = Image.find(@project.main_image)
		@tn_image = Image.find(Thumbnail.find(@project.tn_images))
	end

	def update
		@project = Project.find(params[:id])
		@project.update(safe_project_params)

		redirect_to projects_path(@project)
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

	private

	def safe_project_params
		return params.require(:project).permit(:title, :description, :category, :main_image, :tn_images, :tags, :featured)
	end
end
