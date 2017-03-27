class Player
	attr_accessor :name

	def initialize
		@attempt_number = 0
	end

	def input_name
		@name = gets.chomp
	end

	def make_a_guess
		puts " Enter a four digit number as a guess: Choose between numbers from 1-6"
		gets.chomp
	end
end
