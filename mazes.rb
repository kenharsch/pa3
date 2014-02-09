#mazes file for pa3
#Ken Harsch
#kharsch@brandeis.edu

class Maze

	attr_reader :array, :n, :m, :maze

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

	def solve(begX, begY, endX, endY)
		

	end

	def trace(begX, begY, endX, endY)

	end

end