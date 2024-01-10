# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

module TestArrays
  BASIC_ARR = [1, 2, 3, 4].freeze
  LONG_BASIC = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
  REALLY_LONG = Array.new(64) { rand(1..100) }.freeze
end

foo = Tree.new(TestArrays::BASIC_ARR)
bar = Tree.new(TestArrays::LONG_BASIC)
baz = Tree.new(TestArrays::REALLY_LONG)

foo.insert(100)

foo.pretty_print

puts "here it is: 100! -=-#{foo.find(100).data}-=-"

# baz.pretty_print
