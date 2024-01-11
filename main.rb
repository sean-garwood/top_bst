# frozen_string_literal: true

require_relative 'lib/comparable'
require_relative 'lib/pretty_print'
require_relative 'lib/search'

require_relative 'lib/node'
require_relative 'lib/tree'

module TestArrays
  BASIC_ARR = [1, 2, 3, 4].freeze
  LONG_BASIC = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
  REALLY_LONG = Array.new(64) { rand(1..100) }.freeze
end


basic = proc { Tree.new(TestArrays::BASIC_ARR) }
longer_basic = proc { Tree.new(TestArrays::LONG_BASIC) }
long = proc { Tree.new(TestArrays::REALLY_LONG) }
custom = proc { |len, min, max| Tree.new(Array.new(len) { rand(min..max) }) }

foo = longer_basic.call
puts 'initial tree'
foo.pretty_print
puts 'deleted 8:'
foo.delete(8)
foo.pretty_print
puts 'deleted 3:'
foo.delete(3)
foo.pretty_print
