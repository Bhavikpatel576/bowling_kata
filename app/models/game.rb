class Game < ApplicationRecord
	has_many :scores
	belongs_to :user

	#add the logic to my bowling game
	#game will have hte following behaviors

	def initailize
		@score = Score.create
		@frame = Struct.new(:roll1, :rool2)
		@frames = Array.new(@frame)
	end

	def total_score
	end

	#On the 10th frame, you're allowed to roll 3 balls if a strike or spare is made
	def current_frame
	end

	#called each time a player rolls a ball, argument is the number of pins knocked down
	def roll(pins_knocked_down)
	end

	def score
	end

	private

	def store_game_information
	end
end
