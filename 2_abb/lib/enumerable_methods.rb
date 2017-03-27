module Enumerable
	def my_each
		for element in self
			yield element
		end
		self
	end

	def my_each_with_index
		for element in self
			yield(element, self.index(element))
		end
		self
	end

	def my_select
		arr = []
		self.my_each {|element| arr << element if yield(element)}
		arr
	end

	def my_all?
		# state = true
		self.my_each {|element| return false unless yield(element)}
		true
	end

	def my_any?
		self.my_each {|element| return true if yield(element)}
		false
	end

	def my_none?
		self.my_each {|element| return false if yield(element)}
		true
	end

	def my_count(number = nil)
		counter = 0
		if !number.nil?
			self.my_each {|a| counter += 1 if a == number}
		elsif block_given?
			self.my_each {|element| counter += 1 if yield(element)}
		else
			self.my_each {|element| counter += 1}
		end
		counter
	end
	                            
	def my_map(proc = nil)
		arr = []
		if proc.nil?
			self.my_each {|element| arr << yield(element)}
		else
			self.my_each {|element| arr << proc.call(element)}
		end
		arr
	end

	def my_inject(number = nil)
		number.nil? ? sum = 0 : sum = number
		self.my_each do |num|
		 	sum = yield(sum, num)
		end
		sum
	end

	def multiply_els
		self.my_inject(1) {|sum, number| sum * number}
	end
end
