# frozen_string_literal: true

require_relative 'lib/comparable'
require_relative 'lib/edit'
require_relative 'lib/pretty_print'
require_relative 'lib/search'
require_relative 'lib/traverse'

require_relative 'lib/node'
require_relative 'lib/tree'


TEST_LEN = 15
TEST_RANGE_MIN = 1
TEST_RANGE_MAX = 100

def series(len = TEST_LEN)
  Tree.new(Array(1..len))
end

def random_tree(
  len = TEST_LEN, val_min = TEST_RANGE_MIN, val_max = TEST_RANGE_MAX
)
  Tree.new(Array.new(len) { rand(val_min..val_max) })
end

top_tree = random_tree
puts top_tree

puts "Is the tree balanced? #{top_tree.balanced?}"

puts top_tree.root.left.is_a? Tree
puts "\nORDERS\n--------"
puts "\nLevel: #{top_tree.level_order}"
puts "\nPre (NLR): #{top_tree.root.pre_order}"
puts "\nPost (LRN): #{top_tree.root.post_order}"
puts "\nIn (LNR): #{top_tree.root.in_order}"
