class Node
	attr_accessor :value, :next_node

	def initialize(value)
		@value = value
		@next_node = nil
	end
end

class LinkedList
	def initialize(value)
		@head = Node.new(value)
	end

	def append(value)
		# new_node = Node.new(value)
		current_node = @head
		while current_node.next_node != nil
			current_node = current_node.next_node
		end
		current_node.next_node = Node.new(value)
	end

	def prepend(value)
		new_node = Node.new(value)
		new_node.next_node = @head
		@head = new_node
	end

	def size
		count = 0
		current_node = @head
		while current_node != nil
			current_node = current_node.next_node
			count += 1
		end
		count
	end

	def head
		@head.value
	end

	def tail
		current_node = @head
		while current_node.next_node != nil
			current_node = current_node.next_node
		end
		current_node.value
	end

	def at(index)
		count = 0
		current_node = @head
		until count == index
			current_node = current_node.next_node
			count += 1
		end
		current_node.value
	end

	def pop
		current_node = @head
		if size == 1
			current_node = nil
		else
			while current_node.next_node.next_node != nil
				current_node = current_node.next_node
			end
			current_node.next_node = nil
		end
	end

	def contains?(value)
		current_node = @head
		while current_node != nil
			return true if current_node.value == value
			current_node = current_node.next_node
		end
		return false
	end

	def find(data)
		current_node = @head
		count = 0
		while current_node != nil
			return count if current_node.value == data
			current_node = current_node.next_node
			count += 1
		end
		return "Data could not be found"
	end

	def to_s
		current_node = @head
		str = ""
		while current_node != nil
			str << "( #{current_node.value} ) -> "
			current_node = current_node.next_node
		end
		str + "nil"
	end

	def insert_at(index, value)
		current_node = @head
		new_node = Node.new(value)
		if index == 0
			prepend(value)
		else
			(index - 1).times {current_node = current_node.next_node}
			change_node = current_node.next_node
			current_node.next_node = new_node
			new_node.next_node = change_node if change_node != nil
		end
	end

	def remove_at(index)
		current_node = @head
		if index == 0
			@head = @head.next_node
		else
			(index - 1).times {current_node = current_node.next_node}
			current_node.next_node = current_node.next_node.next_node
		end
	end
end