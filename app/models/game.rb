FRAMES = 10
POSSIBLEROLLS = 21

class Game < ApplicationRecord
	attr_accessor :rolls, :current_roll
	has_many :scores
	belongs_to :user

	#add the logic to my bowling game
	#game will have hte following behaviors

	def initialize
		#@score = Score.create
		@score = 0
		@rolls = Array.new(POSSIBLEROLLS,0)
		@current_roll = 0
	end

	#called each time a player rolls a ball, argument is the number of pins knocked down
	def roll(pins)
		@rolls[@current_roll] = pins
		@current_roll += 1
	end

	def total_score
	end

	def score
		scores = 0
		idx = 0
		10.times do |_|
			if spare? (idx)
				scores += spare_score(idx)
			else
				scores += rolls[idx] + rolls[idx + 1]
			end
			idx += 2
		end
		scores
	end

	def spare?(idx)
		rolls[idx] + rolls[idx + 1] == 10
	end

	def spare_score(idx)
		rolls[idx] + rolls[idx + 1] + rolls[idx + 2]
	end

	#On the 10th frame, you're allowed to roll 3 balls if a strike or spare is made
	def current_frame
	end

	private

	def store_game_information
	end
end
