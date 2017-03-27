class Player
	attr_reader :turn, :input

	def initialize
		@turn = 1
	end

	def symbol
		turn % 2 == 0 ? "O" : "X"
	end
end