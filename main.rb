# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

module TestArrays
  BASIC_ARR = [1, 2, 3, 4]
  LONG_BASIC = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  REALLY_LONG = Array.new(64) { rand(1..100) }
end

foo = Tree.new(TestArrays::BASIC_ARR)
bar = Tree.new(TestArrays::LONG_BASIC)
baz = Tree.new(TestArrays::REALLY_LONG)

foo.pretty_print
foo.insert(-1)

foo.pretty_print
