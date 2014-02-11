#mazes file for pa3
#Ken Harsch
#kharsch@brandeis.edu

class Maze

	attr_reader :array, :n, :m, :maze, :check_values, :move_trace
	#makes an array of arrays to  hold the maze
	def initialize (n, m)
		@width = n 
		@height = m 
		@array = []
		@maze = Array.new(n*2 + 1) {Array.new(m*2 + 1)}
	end

	def load(arg)
		arg.each_char do |digit|
			@array << digit
		end
	end
	#fills the maze by iterating through rows and cols
	def make_maze
	k = 0
		for i in 0 ..@height*2
			for j in 0 ..@width*2
				@maze[i][j] = @array[k]
				k += 1
			end
		end
	end

	def show_maze
		for i in 0 ..@height*2 
			for k in 0 ..@width*2
			print @maze[i][k]
			end
			puts ""
		end
	end

	def get_value(x, y)
		return @maze[x][y]
	end
	#takes the coords of a node, returns array of adjacent values
	def check(x, y)
		check_values = []
		check_values[0] = get_value(x - 1, y)
		check_values[1] = get_value(x + 1, y)
		check_values[2] = get_value(x, y - 1)
		check_values[3] = get_value(x, y + 1)
		return check_values
	end
	#solve algorithm uses stack to push and pop locations
	def solve(begX, begY, endX, endY)
		start = [begX, begY]
		finish = [endX, endY]
		stack = []
		move_trace = []
		#checks to see if start or end have "wall" value
		if get_value(begX, begY) == 1 || get_value(endX, endY) == 1
			puts "Invalid start or finish location"
			return false
		end
		stack.push(start)
		move_trace.push(start)
		while !stack.empty?
			current = stack.pop()
			if current == finish
				puts "The maze is solved"
				puts "The cells you visited are: "
				return move_trace
			end		

			trace(current).each do |node|
				if  !move_trace.include? node
					stack.push(node)
					move_trace.push(node)
				end
			end
		end
		puts "Cannot be solved"
		return false
	end
	#takes an array with 2 values, returns an array of variable size
	def trace(node)
		x = node[0]
		y = node[1]

		open_moves = []
		values = check(x, y)
		if values[0] == "0"
			temp = [node[0] - 1, node[1]]
			open_moves.push temp
		end

		if values[1] == "0"
			temp = [node[0] + 1, node[1]]
			open_moves.push temp
		end

		if values[2] == "0"
			temp = [node[0], node[1] - 1]
			open_moves.push temp
		end

		if values[3] == "0"
			temp = [node[0], node[1] + 1]
			open_moves.push temp
		end
		return open_moves
	end

end