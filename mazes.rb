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
		puts arg.length
		arg.each_char do |digit|
			@array << digit
		end
		puts @array.length
	end

	def make_maze
		k = 0
			for i in 0 ..@height*2
				for j in 0 ..@width*2
					@maze[i][j] = @array[k]
					k += 1
				end
			end
		p maze
	end

end