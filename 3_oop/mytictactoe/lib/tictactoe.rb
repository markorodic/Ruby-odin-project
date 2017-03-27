class Game
	attr_reader :input, :player, :board

	def initialize
		@player = Player.new
		@board = Board.new
	end

	def play
		while !board.is_it_a_winning_game?
			board.draw_score
			prompt
		end
		winner
		board.draw_score
	end

	def prompt
		puts "#{player.symbol == "X" ? "Player One" : "Player Two" }: select a number from the board"
		@input = gets.chomp
		n = input.to_i
		board.update_score(n, player.symbol)
		player.whos_turn
	end

	def winner
		puts "\n"
		puts "------------------------"
		puts "Game Over: Player #{player.which_player} wins"
		puts "------------------------"
	end

end

class Board
	attr_accessor :score, :cells

	def initialize
		@score = (1..9).to_a
		@cells = {
			one: 1,
			two: 2,
			three: 3,
			four: 4,
			five: 5,
			six: 6,
			seven: 7,
			eight: 8,
			nine: 9
		}
	end

	def draw_score
		puts "\n"
		puts "\s#{cells.values[0]}\s|\s#{cells.values[1]}\s|\s#{cells.values[2]}"
		puts "-----------"
		puts "\s#{cells.values[3]}\s|\s#{cells.values[4]}\s|\s#{cells.values[5]}"
		puts "-----------"
		puts "\s#{cells.values[6]}\s|\s#{cells.values[7]}\s|\s#{cells.values[8]}"
		puts "\n"
	end

	def update_score(n, symb)
		score[n-1] = symb
		cells[(cells.keys[n-1])] = symb
	end

	def is_it_a_winning_game?
		score[0, 3].uniq.size == 1 or
		score[3, 3].uniq.size == 1 or
		score[6, 3].uniq.size == 1 or
		score.values_at(0, 3, 6).uniq.size == 1 or
		score.values_at(1, 4, 7).uniq.size == 1 or
		score.values_at(2, 5, 8).uniq.size == 1 or
		score.values_at(0, 4, 8).uniq.size == 1 or
		score.values_at(2, 4, 6).uniq.size == 1
	end
end

class Player
	attr_reader :turn

	def initialize
		@turn = 1
	end

	def symbol
		turn % 2 == 0 ? "O" : "X"
	end

	def whos_turn
		@turn += 1
	end

	def which_player
		turn % 2 + 1
	end
end

# new_game = Game.new
# new_game.play