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

def print_orders(tree)
  orders = <<-ORDERS
  \n---------------ORDERS--------
  \nLevel: #{tree.level_order}
  \nPre (NLR): #{tree.root.pre_order}
  \nPost (LRN): #{tree.root.post_order}
  \nIn (LNR): #{tree.root.in_order}
  \n-------------------------------
  \n
  ORDERS
  puts orders
end

puts "initial tree"
puts top_tree = random_tree
puts "Is the tree balanced? #{top_tree.balanced?}"
print_orders(top_tree)
top_tree.insert(101)
top_tree.insert(1001)
top_tree.insert(10_001)
top_tree.insert(100.5)
puts top_tree
puts "modified tree"
puts "Is the tree balanced? #{top_tree.balanced?}"
puts rebalanced = top_tree.rebalance
puts 'rebalanced tree'
puts "Is the tree balanced? #{rebalanced.balanced?}"

print_orders(rebalanced)
