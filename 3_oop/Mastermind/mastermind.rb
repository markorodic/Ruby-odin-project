class Board
	
end


class Game
	  	COLOURS = ["R", "G", "B", "Y", "W", "B"]
	def initialize
		@board_positions = Hash[(1..32).to_a.map {|x| [x, "-"]}]
		@info = Hash[(1..16).to_a.map {|z| [z, ""]}]
		@attempt_number = 0
	end

	def play
		game_intro
		input_name
		draw_board
		while winning_combination != winning_guess
			make_a_move
			feedback
			break if attempt_number == 8
		end
		puts outcome
	end

	def game_intro
		system 'clear'
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		puts " *********************************************"
		puts "\n\n"
		puts " ---------------------------------------------"
		puts "       Welcome to the Mastermind game"
		puts " ---------------------------------------------"
		puts "\n\n"
		puts " *********************************************"
		puts "\n\n\n\n\n\n"
		
	end

	def input_name
		puts ""
		puts "              What's your name?\n\n\n\n\n\n"
		puts "---------------------------------------------"
		@name = gets.chomp
		puts "\n\n\n\n\n\nRight #{name} let's play Mastermind\n\nThese are the instructions:"
		puts "---------------------------"
		puts "You must guess the correct combination of 4 numbers from 6 numbers within 8 attempts\nNumbers can be repeated within a combination\n\nGot it?...Good luck!"
	end

	def make_a_move
		puts "Enter a four digit number as a guess: Choose between numbers from 1-6"
		input = gets.chomp
		update_board(input)
		draw_board
	end

	def feedback
		puts "\n\n *********************************************"
		puts " FEEDBACK: #{number_of_wrongly_positioned}: number(s) right; #{number_of_correct}: number(s) in right position"
		puts " *********************************************"
		puts "\n\n"
		puts " ---------------------------------------------"
	end

	def outcome
		system 'clear'
		winning_combination == winning_guess ? "\n\n\n\n\n\n\n\n\n\n*********** YOU ARE A WINNER #{name.upcase} **************\n\n\n\n\n\n\n\n\n\n" : "\n\n\n\n\n\n\n\n************* You are a loooooooser #{name} ****************\n---------------------------------------------------------\n             The answer was #{winning_combination}n\n\n\n"
  	end

	def draw_board
		get_index = 0
		info_index = 0
		puts " ---------------------------------------------"
		8.times do
			puts "\n     Attempt #{get_index/4 + 1}:       |\s#{board_positions.values[get_index]}\s|\s#{board_positions.values[get_index+1]}\s|\s#{board_positions.values[get_index+2]}\s|\s#{board_positions.values[get_index+3]}\s|             #{info.values[info_index]}:#{info.values[info_index+1]}"
			get_index += 4
			info_index += 2
		end
		puts "\n ---------------------------------------------"
	end

	def winning_guess
		range = (attempt_number) * 4
		board_positions.values[(range - 4)..(range - 1)]
	end

	def winning_combination
		(1..6).to_a.sample(4)
	end

	def update_board(input)
		@guess = input.split("").map(&:to_i)
		i = 1
		4.times do
			board_positions[attempt_number * 4 + i] = @guess[i-1]
			i += 1
		end
		info[attempt_number * 2 + 1] = number_of_wrongly_positioned
		info[attempt_number * 2 + 2] = number_of_correct
		@attempt_number += 1
	end

	def number_of_correct
		i = -1
		guess.select {|n| n == winning_combination[i += 1]}.size
	end

	def number_of_wrongly_positioned
		win = {
			1=> 0,
			2=> 0,
			3=> 0,
			4=> 0,
			5=> 0,
			6=> 0
			}
		winning_combination.each {|n| win[n] += 1} #
		guess.each {|n| win[n] -= 1 if win[n] > 0}
		4 - win.values.inject {|a, b| a+b} - number_of_correct
	end

	private

	def info
		@info
	end

	def guess
		@guess
	end

	def board_positions
		@board_positions
	end

	def attempt_number
		@attempt_number
	end

  	def name
  		@name
  	end
end


first = Game.new
first.play