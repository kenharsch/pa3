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

	def check(a, b)
		check_values = []
		check_values[0] = get_value(a - 1, b)
		check_values[1] = get_value(a + 1, b)
		check_values[2] = get_value(a, b - 1)
		check_values[3] = get_value(a, b + 1)
		return check_values
	end

	def solve(begX, begY, endX, endY)
		if get_value(begX, begY) == 1 || get_value(endX, endY) == 1
			puts "Invalid starting or ending point"
			return
		end
		trace = []
		last  = (begX, begY)
		can_move = true
		while can_move == true
			

		end


	end

	def trace(begX, begY, endX, endY)

	end

end