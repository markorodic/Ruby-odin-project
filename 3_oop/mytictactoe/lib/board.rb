class Board
	attr_reader :cells, :board

	def initialize
		@board = (1..9).to_a
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

	def draw_board
		puts "\n"
		puts "\s#{cells.values[0]}\s|\s#{cells.values[1]}\s|\s#{cells.values[2]}"
		puts "-----------"
		puts "\s#{cells.values[3]}\s|\s#{cells.values[4]}\s|\s#{cells.values[5]}"
		puts "-----------"
		puts "\s#{cells.values[6]}\s|\s#{cells.values[7]}\s|\s#{cells.values[8]}"
		puts "\n"
	end

	def update_board
		n = input.to_i
		board[n-1] = symbol
		cells[(cells.keys[n-1])] = symbol
	end
end