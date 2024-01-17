# frozen_string_literal: true

require_relative 'lib/comparable'
require_relative 'lib/edit'
require_relative 'lib/pretty_print'
require_relative 'lib/search'
require_relative 'lib/traverse'

require_relative 'lib/node'
require_relative 'lib/tree'

MIN = 1
MAX = 48

def series(len = MAX)
  Tree.new(Array(1..len))
end

def random_tree(len = MAX, min = MIN, max = len)
  Tree.new(Array.new(len) { rand(min..max) })
end

bar = series(MAX)
bar.pretty_print

puts "#{bar.depth(bar.find(MAX))} should be 4"
puts "#{bar.depth(bar.root)} should be 0"
puts bar.levels
