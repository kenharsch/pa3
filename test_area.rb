#test area for maze class
#Ken Harsch
#kharsch@brandeis.edu

require_relative "mazes.rb"



m = Maze.new(4,4)
m.load("111111111101000001101011101101010101100010101111110101110000001110111111111111111")
m.make_maze
#p m.get_value(2, 6)
puts "m check 44 = "
p m.check(4, 3)
p m.solve(4, 3, 6, 4)