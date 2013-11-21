class RockPaperScissorsController < ApplicationController
	def index
		create_weapons
	end

	def show
		create_weapons
		@player_played = params[:id]
		@computer_played = @weapons.sample

		outcome = @beatings[@player_played][@computer_played]
		@result = outcome.to_s
	end

	private

	def create_weapons
		@weapons = ["rock", "paper", "scissors"]
		@beatings = {
			"rock" => {"rock" => :tie, "paper" => :lose, "scissors" => :win},
			"paper" => {"rock" => :win, "paper" => :tie, "scissors" => :lose},
			"scissors" => {"rock" => :lose, "paper" => :win, "scissors" => :tie}
		}
	end
end
