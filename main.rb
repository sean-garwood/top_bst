# frozen_string_literal: true

require_relative 'lib/comparable'
require_relative 'lib/pretty_print'
require_relative 'lib/search'

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

foo = random_tree

foo.pretty_print
foo.delete(foo.root.right.data)
foo.pretty_print
