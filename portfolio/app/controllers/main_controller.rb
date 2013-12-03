class MainController < ApplicationController
	def index
		@page_title = "Main page title"
		@subtitle = "Blah."
		@projects = Project.first(12)
	end

	def about
		@page_title = "About me"
		@subtitle = "Blah."
	end

	def contact
		@page_title = "Let's chat"
		@subtitle = "Blah."
	end
	def login
		@page_title = "Login to the admin area"
	end
end
