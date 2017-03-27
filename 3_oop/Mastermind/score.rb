class Scoring
	POSSIBLE_NUMBERS = [1, 2, 3, 4, 5, 6]

	attr_reader :winning_combo

	def initialize
		@winning_combo = POSSIBLE_NUMBERS.sample(4)
	end

	

	def number_of_correct(guess)
		i = -1
		guess.select {|n| n == winning_combo[i += 1]}.size
	end

	def number_of_wrongly_positioned(guess)
		win = {
			1=> 0,
			2=> 0,
			3=> 0,
			4=> 0,
			5=> 0,
			6=> 0
			}
		winning_combo.each {|n| win[n] += 1}
		guess.each {|n| win[n] -= 1 if win[n] > 0}
		4 - win.values.inject {|a, b| a+b} - number_of_correct(guess)
	end
end