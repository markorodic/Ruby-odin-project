def caesar_cipher(text, key)
	new_word = []
	# if text.downcase.each_byte > 96
		text.downcase.each_byte do |char|
			new_char = (char + key)
			if char > 96 && char < 123
				new_char > 122 ? new_word << (96 + new_char % 122).chr : new_word << new_char.chr
			else
				new_word << char.chr
			end
		end
	# end
	new_word.join.capitalize
end