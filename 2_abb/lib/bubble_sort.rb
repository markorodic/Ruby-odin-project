def bubble_sort(array)
	sorted_elements = 0
	elements = array.size - 1
	elements.times do
		sorted = true
		array.each_with_index do |number, index|
			if index < elements - sorted_elements
				array[index], array[index + 1], sorted = array[index + 1], array[index], false if number > array[index + 1]
			end
		end
		sorted_elements += 1
		break if sorted
	end
	array
end

def bubble_sort_by(array)
	sorted_elements = 0
	elements = array.size - 1
	elements.times do
		sorted = true
		array.each_with_index do |word, index|
			if index < elements - sorted_elements
				array[index], array[index + 1], sorted = array[index + 1], array[index], false if yield(word, array[index + 1]) == 1
			end
		end
		sorted_elements += 1
		break if sorted
	end
	array
end

example_1 = bubble_sort([3,5,4,1,2])

example_2 = bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
        right <=> left
        end

puts example_1, example_2