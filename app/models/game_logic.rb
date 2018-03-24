
class GameLogic
    #add the logic to my bowling game
	#game will have hte following behaviors

	def initialize(what)
		@what = what
		#@score = Score.create
		@score = 0
		@rolls = Array.new(POSSIBLEROLLS,0)
		@current_roll = 0
		@frameindex = 0
	end

	#called each time a player rolls a ball, argument is the number of pins knocked down
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