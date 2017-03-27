def stock_picker(array)
	highest_range = 0
	days = [0, 0]
	array.each do |number|
		range = array.slice(array.index(number),array.length).inject {|a, b| a > b ? a : b} - number
		if range > highest_range
			highest_range = range
			days[0], days[1] = array.index(number), array.index(range+number)
		end
	end
	p days
end

stock_picker([17,3,6,9,15,8,6,1,10])