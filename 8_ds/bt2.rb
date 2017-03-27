class Node
	attr_accessor :value, :parent, :left, :right
	
	def initialize(value, parent, left, right)
		@value = value
		@parent = parent
		@left = left
		@right = right
	end
end

class BinaryTree
	attr_accessor :array, :root

	def initialize(array)
		@array = array
		@root = Node.new(array[0], nil, nil, nil)
	end

	def build_tree
		array.each do |node|
			add(node)
		end
	end

	def add(node, current_node = root)
		unless node == current_node.value
			if node < current_node.value
				current_node.left.nil? ? current_node.left = Node.new(node, current_node, nil, nil) : add(node, current_node.left)
			else
				current_node.right.nil? ? current_node.right = Node.new(node, current_node, nil, nil) : add(node, current_node.right)
			end
		end
	end

	def depth_first_search(value)
		queue = [root]
		until queue.empty?
			current_node = queue.shift
			return current_node if current_node.value == value
			queue << current_node.left unless current_node.left.nil?
			queue << current_node.right unless current_node.right.nil?
		end
		nil
	end

	def depth_first_search(value)
		stack = [root]
		until stack.empty?
			current_node = stack.pop
			return current_node if current_node.value == value
			stack << current_node.left unless current_node.left.nil?
			stack << current_node.right unless current_node.right.nil?
		end
		nil
	end

	def dfs_rec(value, current_node = root)
		return current_node if current_node.value == value
		left_result = dfs_rec(value, current_node.left) if current_node.left
		return left_result if left_result
		right_result = dfs_rec(value, current_node.right) if current_node.right
		return right_result if right_result
		nil
	end
end

