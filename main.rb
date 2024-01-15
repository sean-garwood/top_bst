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


foo = series(10)

foo.pretty_print

p foo.level_order
foo.root.in_order { |n| puts n.data**2 }

foo.root.pre_order { |n| puts n.data**2 }
foo.root.post_order { |n| puts n.data**2 }
