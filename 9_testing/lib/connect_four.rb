class Board
	attr_accessor :board, :moves

	def initialize
		@board = Array.new(7, [])
		@moves = 0
	end

	def add_to_board(column, token)
		unless board[column-1].size > 6
			board[column-1].empty? ? board[column-1] = [token] : board[column-1] << token
			return board
		end
		return "Column #{column} is full, choose another!"
	end

	def four_in_a_row?
		winning_col.each do |arr|
			return true if arr.uniq.size == 1
		end

		winning_rows.each do |arr|
			return true if arr.uniq.size == 1
		end

		winning_diagonals.each do |arr|
			return true if arr.uniq.size == 1
		end

		return false
	end

	def winning_col
		i = 0
		board.each do |col|
			[[board[i].slice(0,4)], [board[i].slice(1,4)], [board[i].slice(2,4)]]
			i += 1
		end
	end

	def winning_rows
		array = []
		row = 0
		until row == 7 do
			array << []
			board.each do |col|
				array[row] < col.shift
			end
		end
		array
		
	end

	def winning_diagonals
		
	end

	# def four_in_a_col?
	# 	board.select do |col|
	# 		# return true if (col.slice(0,4).uniq.size == 1 || col.slice(1,4).uniq.size == 1 || col.slice(2,4).uniq.size == 1)
	# 		i = 0
	# 		until i == 3 do
	# 			return true if (col.slice(i,4).uniq.size == 1)
	# 			i += 1
	# 		end
	# 		return false
	# 	end
	# end

	

end

class Game

	def play(input)
		# puts "Player #{which_player}: Select a column 1 to 7"
		# input = gets.chomp
		@moves += 1
		(input >= 1 && input <= 7) ? add_to_board(input, which_player) : "Out of bounds"
	end
	
end

class Player

	def which_player
		moves % 2 == 1 ? "X" : "O"
	end

end
