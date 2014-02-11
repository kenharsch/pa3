#mazes file for pa3
#Ken Harsch
#kharsch@brandeis.edu



class Maze

	attr_reader :array, :n, :m, :maze, :check_values

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

	def check(x, y)
		check_values = []
		check_values[0] = get_value(x - 1, y)
		check_values[1] = get_value(x + 1, y)
		check_values[2] = get_value(x, y - 1)
		check_values[3] = get_value(x, y + 1)
		return check_values
	end

	def solve(begX, begY, endX, endY)
		start = [begX, begY]
		finish = [endX, endY]
		stack = []
		move_trace = []
		dead = []
		if get_value(begX, begY) == 1 || get_value(endX, endY) == 1
			message(1)
			return false
		end
		stack.push(start)
		move_trace.push(start)
		while !stack.empty?
			current = stack.pop()
			puts "current stack pop = "
			p current
			puts "aft curr"
			if current == finish
				message(3)
				return true
			end		
			trace(current).each do |node|
				puts "node in curr loop ="
				p node
				if  !move_trace.include? node
					stack.push(node)
					move_trace.push(node)
					puts "stack after push= "
					p stack
					puts "pushed load value = "	
					p node
				end
			end
		end
		puts "end while loop"
		message(4)
		return false
	end

	def message(m)
		case m 
		when 1
			puts "Invalid starting or ending point"
		when 2
			puts "Cannot move from this position"
		when 3
			puts "Finished"
		when 4
			puts "Cannot be solved"
		end	
	end

	def trace(node)
		x = node[0]
		y = node[1]

		open_moves = []
		values = check(x, y)
		puts "values check in trace ="
		p values
		if values[0] == "0"
			puts "v 0 ="
			p values[0]
			temp = [node[0] - 1, node[1]]
			open_moves.push temp
		end

		if values[1] == "0"
			puts "v 1 ="
			p values[1]
			temp = [node[0] + 1, node[1]]
			open_moves.push temp
		end

		if values[2] == "0"
			puts "v 2 ="
			p values[2]
			temp = [node[0], node[1] - 1]
			open_moves.push temp
		end

		if values[3] == "0"
			puts "v 3 ="
			p values[3]
			temp = [node[0], node[1] + 1]
			open_moves.push temp
		end
		puts "open moves ="
		p open_moves
		return open_moves
	end

end