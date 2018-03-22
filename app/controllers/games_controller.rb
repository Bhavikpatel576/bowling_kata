
class GamesController < ApplicationController
	#we shoudl add a before_action :require_login
	def new
		@game = Game.new
	end

	#should a user instantiate a new game?
	#current_user.game
	def create
		@user = current_user
		binding.pry
		@game = @user.games.new
		if @game.save
			binding.pry
			redirect_to user_game_path(@user, @game.id)
		else
			render "new"
		end
	end

	def show
		
	end

end
