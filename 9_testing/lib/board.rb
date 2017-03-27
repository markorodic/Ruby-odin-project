class Board
	attr_accessor :grid

	def initialize
		@grid = Array.new(7, [])
	end

	def add_to_board(column, token)
		unless grid[column-1].size > 6
			grid[column-1].empty? ? grid[column-1] = [token] : grid[column-1] << token
			return grid
		end
	return "Column #{column} is full, choose another!"
	end

	def winning_columns
		i = 0
		arr = []
		grid.each do |col|
			arr.push(grid[i].slice(0,4), grid[i].slice(1,4), grid[i].slice(2,4))
			i += 1
		end
		arr
	end

	def winning_rows
		array = []
		row = 0
		until row == 6 do
			array << []
			grid.each do |col|
				array[row] << col.shift
			end
			row += 1
		end
		i = 0
		arr = []
		array.each do |col|
			arr.push(array[i].slice(0,4), array[i].slice(1,4), array[i].slice(2,4), array[i].slice(3,4))
			i += 1
		end
		arr
	end

	def winning_diagonals
		start_row = 3
		arr = []
		4.times do
			start_col = 0
			3.times do
				arr << [grid[start_row][start_col],grid[start_row-1][start_col+1],grid[start_row-2][start_col+2],grid[start_row-3][start_col+3]]
				start_col += 1
			end
			start_row += 1
		end
		arr
	end

	def four_in_a_row?
		winning_columns.each do |arr|
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
end