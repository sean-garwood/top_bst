# frozen_string_literal: true

# bonus: compare nodes using data.
module Comparable
  def same_data?(node_a, node_b)
    node_a.data == node_b.data
  end

  def less_than?(node_a, node_b)
    node_a.data < node_b.data
  end
end

# represents a node on a binary search tree
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# ordered collection of nodes
# all values to left of root node are less
# all values to right of root node are greater
class Tree
  # given an array of values, create a tree
  def initialize(arr = nil)
    @arr = arr
    # need to find the middle of the sorted arr to set the root index
    @root = find_middle_index
  end

  def find_middle_index(arr)
    return nil if array.nil?

    arr = arr.uniq.sort
    mid = arr.length / 2
    mid.floor
  end
end
