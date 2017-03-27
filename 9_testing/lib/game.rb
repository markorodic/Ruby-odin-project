require_relative 'player'

class Game
	attr_accessor :player_one, :player_two

	def initialize
		@player_one = Player.new("X")
		@player_two = Player.new("O")
		# @board = Board.new
	end

	# def play
	# 	until win == "X" || win == "O"
	# 		turn(player_one)
	# 		turn(player_two)

	# 	end
	# end
end