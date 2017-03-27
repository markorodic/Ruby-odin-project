# Board = Struct.new(:pos, :path)
class Board
	attr_accessor :position, :path

	def initialize(position, path)
		@position = position
		@path = path
	end
end

class Knight
	def knight_moves(start, finish)
		return "Your starting and ending positions are the same" if start == finish
		return "Your starting position is not on the Board" if start.select {|n| n if n > 0 && n < 9}.size != 2
		return "Your ending position is not on the Board" if finish.select {|n| n if n > 0 && n < 9}.size != 2
		#check start against finish
		#check start and end are in bounds

		queue = [Board.new(start, [])]
		visited = [start]

		# creates an infinite loop?
		until queue.empty?
			current = queue.shift

			moves_available = possible_moves(current.position).select {|pos| !visited.include?(pos)}

			if moves_available.include?(finish)
				current.path << finish
				puts "Moves taken: #{current.path.size}"
				current.path.each {|path| p path}
				break
			end

			moves_available.each do |pos|
				queue << Board.new(pos, current.path + [pos])
				visited << pos
			end
		end
	end

	def possible_moves(position)
		available_moves = [[2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2], [1,-2], [2,-1]]
		possible_moves = available_moves.map {|move| move.map {|n| n += position[move.index(n)]}}
		
	end

	def out_of_bounds(moves)
		bounds = *(1..8)
		moves.select {|move| move if bounds.include?(move[0]) && bounds.include?(move[1])}
	end

	# def output
	# 	no = path.size
	# 	puts "You made it in #{no} moves! Here's your path:\n"
	# 	path.each {|move| puts move}
	# end
end

