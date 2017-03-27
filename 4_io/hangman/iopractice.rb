class Hangman
	def initialize
		@guess_letter = ""
		@guesses_remaining = 12
		@word_array = []
	end

	def select_a_word
		file = "5desk.txt"
		words = []
		open(file).readlines.select {|line| words << line if line.length < 13 && line.length > 4}
		@word_array =  words[rand(0..(words.length))].downcase.split(//)[0..-3]
		# @word_array.each {|letter| @hangman_lines[letter] = "_"}		
		@hangman_lines = Hash[(0..(@word_array.length - 1)).to_a.map {|number| [number, "-"]}]
	end

	def lets_play
		select_a_word
		while @guesses_remaining > 0
			system 'clear'
			puts "Guess the word; you have #{@guesses_remaining} guess remaining to guess #{@word_array}\n\n\n\n"
			update_hash
			make_guess
			break if !@hangman_lines.values.include?("-")
		end
		@hangman_lines.values.include?("-") 
	end

	def update_hash
		index = []
		@word_array.each_with_index {|char, i| index << i if char == @guess_letter}
		if @word_array.include?(@guess_letter)
			index.each {|num| @hangman_lines[num] = @word_array[num]}
		end
		make_lines
	end

	def make_lines
		str = ""
		@hangman_lines.values.each do |value|
			str += value
			str += "\s"
		end
		puts str
	end

	def make_guess
		puts "\n\nChoose a letter that you would like to try:"
		@guess_letter = gets.chomp.downcase
		@guesses_remaining -= 1 if !@word_array.include?(@guess_letter)
	end
end

hang = Hangman.new
hang.lets_play