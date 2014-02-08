#test area for maze class
#Ken Harsch
#kharsch@brandeis.edu

require_relative "mazes.rb"
require_relative "solver.rb"

m = Maze.new(4,4)
m.load("111111111001001011101101011101101011100110111110101111110010111111001111111111111")
m.make_maze
