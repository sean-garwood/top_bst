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

foo = series(8)
p foo.level_order
foo.level_order { |n| puts n.data }
foo.pretty_print

foo.delete(6)
foo.pretty_print

foo.insert(6)
foo.pretty_print

bar = [1, 3, 5, 7, 9]
baz = Tree.new(bar)

baz.insert(8)

baz.pretty_print

puts baz.rightmost.data
