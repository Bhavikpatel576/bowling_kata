
class GamesController < ApplicationController
	#we shoudl add a before_action :require_login
	def new
		@game = Game.new
	end

	#should a user instantiate a new game?
	#current_user.game
	def create
		@user = current_user
		@game = @user.games.new
		if @game.save
			render "new"
		else
			redirect_to root_path
		end
	end

	private

	def game_params
		(Game.maximum(:id) || 0) + 1 
	end

end
