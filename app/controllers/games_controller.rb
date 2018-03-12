
class GamesController < ApplicationController
	#we shoudl add a before_action :require_login
	def new
		@game = Game.new
	end

	#should a user instantiate a new game?
	#current_user.game
	def create
		@user = current_user
		@game = Game.new(game_params)
		@user.games = @game
		binding.pry
		if @game.save
			render "new"
		else
			redirect_to root_path
		end
	end

	private

	def game_params
		params.(Game.maximum(:id) || 0) + 1 
	end

end
