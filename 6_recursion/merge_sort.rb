def merge_sort(array)
	if array.size <= 1
		array
	else
		half = (array.size/2).floor
		left = merge_sort(array[0..half - 1])
		right = merge_sort(array[half..array.size])
		merge(left, right)
	end
end

def merge(left, right)
	if left.empty?
		right
	elsif right.empty?
		left
	else		
		left.first < right.first ? [left.first] + merge(left[1..left.size], right) : [right.first] + merge(left, right[1..right.size])
	end
end