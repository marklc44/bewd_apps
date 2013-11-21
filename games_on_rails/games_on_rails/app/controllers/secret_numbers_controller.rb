class SecretNumbersController < ApplicationController
	def index
	end

	def show
		@chosenNumber = params[:id].to_i
		@secretNumber = rand(5) + 1
	end

end
