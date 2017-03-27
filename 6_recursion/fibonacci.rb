def fibs(number)
	previous_value, current_value = 0, 1
	number.times do
		previous_value, current_value = current_value, previous_value + current_value
	end
	previous_value
end

def fibs_rec(number)
	number < 2 ? number : (fibs_rec(number - 1) + fibs_rec(number - 2))
end