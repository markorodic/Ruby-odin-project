require_relative 'board.rb'
require_relative 'player.rb'


class Game
	attr_reader :board, :player

	def initialize
		@player = Player.new
		@board = Board.new
		# @scoring = Scoring.new
	end

	def play
		game_intro
		board.draw_board
		8.times do
			evaluate_board(player.make_a_guess)
			break if board.winner
		end
		puts outcome
	end

	def game_intro
		system 'clear'
		puts "\n\n\n\n\n\n"
		puts " *********************************************"
		puts "\n\n"
		puts " ---------------------------------------------"
		puts "       Welcome to the Mastermind game"
		puts " ---------------------------------------------"
		puts "\n\n"
		puts " *********************************************"
		puts "\n\n\n"
		puts " INSTRUCTIONS:"
		puts " -------------"
		puts " You must guess the correct combination of 4\n numbers from 6 numbers within 8 attempts.\n Numbers can be repeated within a combination.\n\n Got it?...Good luck!"
		puts " ---------------------------------------------"
		puts ""
		puts "\n\n\nWhat's your name?\n\n\n"
		puts "-----"
		player.input_name
	end

	def evaluate_board(input)
		board.update_board(input)
		board.draw_board
		# player.add_attempt
	end

	def outcome
		system 'clear'
		board.winner ? "\n\n\n\n\n\n\n\n\n\n*********** YOU ARE A WINNER #{player.name.upcase} **************\n\n\n\n\n\n\n\n\n\n" : "\n\n\n\n\n\n\n\n************* You are a loooooooser #{player.name} ****************\n---------------------------------------------------------\n             The answer was #{winning_combination}n\n\n\n"
  	end

end

first = Game.new
first.play