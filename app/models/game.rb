FRAMES = 10
POSSIBLEROLLS = 21

class Game < ApplicationRecord
	attr_accessor :rolls, :current_roll, :frameindex
	has_many :scores
	belongs_to :user

	def roll(pins)
		@rolls[@current_roll] = pins
		@current_roll += 1
	end

	def total_score
		score
	end

	def score
		scores = 0
		frameindex = 0
		10.times do |_|
			if strike?(frameindex) 
				scores += strike_score(frameindex)
				frameindex += 1
			elsif spare? (frameindex)
				scores += spare_score(frameindex)
				frameindex += 2
			else
				scores += rolls[frameindex] + rolls[frameindex + 1]
				frameindex += 2
			end
		end
		scores
	end

	def strike?(frameindex)
		rolls[frameindex] == 10
	end

	def strike_score(frameindex)
		rolls[frameindex] + rolls[frameindex + 1] + rolls[frameindex + 2]
	end

	def spare?(frameindex)
		rolls[frameindex] + rolls[frameindex + 1] == 10
	end

	def spare_score(frameindex)
		rolls[frameindex] + rolls[frameindex + 1] + rolls[frameindex + 2]
	end

	def current_frame
		frameindex
	end

	private

	def store_game_information
	end

end
