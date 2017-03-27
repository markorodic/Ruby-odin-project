require_relative 'score.rb'

class Board
	attr_reader :board_positions, :info, :attempt_number, :score, :guess

	def initialize
		@board_positions = Hash[(1..32).to_a.map {|number| [number, "-"]}]
		@info = Hash[(1..16).to_a.map {|number| [number, ""]}]
		@attempt_number = 0
		@score = Scoring.new
	end

	def draw_board
		value_index = 0
		puts score.winning_combo
		system 'clear'
		p score.winning_combo
		puts " THE BOARD\n ---------------------------------------------"
		8.times do
			puts "\n     attempt_number #{value_index/4 + 1}:       |\s#{board_positions.values[value_index]}\s|\s#{board_positions.values[value_index+1]}\s|\s#{board_positions.values[value_index+2]}\s|\s#{board_positions.values[value_index+3]}\s|             #{info.values[value_index/2]}:#{info.values[value_index/2+1]}"
			value_index += 4
		end
		puts "\n ---------------------------------------------"
	end

	def update_board(input)
		@guess = input.split("").map(&:to_i)
		i = 1
		4.times do
			board_positions[attempt_number * 4 + i] = guess[i-1]
			i += 1
		end
		info[attempt_number * 2 + 1] = score.number_of_wrongly_positioned(guess)
		info[attempt_number * 2 + 2] = score.number_of_correct(guess)
		add_attempt_number
	end

	def add_attempt_number
		@attempt_number += 1
	end

	def winner
		score.number_of_correct(guess) == 4
	end

	# def outcome
	# 	system 'clear'
	# 	score.winning_combo == score.winning_combo ? "\n\n\n\n\n\n\n\n\n\n*********** YOU ARE A WINNER #{player.name.upcase} **************\n\n\n\n\n\n\n\n\n\n" : "\n\n\n\n\n\n\n\n************* You are a loooooooser #{player.name} ****************\n---------------------------------------------------------\n             The answer was #{winning_combination}n\n\n\n"
 #  	end
end


# if arr.include?(@@guess_letter)
# 	def find_occurances
# 		index = []
# 		arr.each_with_index {|char, i| index << i if char == "l"}
# 		index.each {|num| hash[num] = arr[num]}
# 	end
# end