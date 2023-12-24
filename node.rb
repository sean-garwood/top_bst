# frozen_string_literal: true

# bonus: compare nodes using data.
module Comparable
  def same_data?(a, b)
    a.data == b.data
  end

  def less_than?(a, b)
    a.data < b.data
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

class Tree
  def initialize(arr = nil)
    @arr = arr
    @root = build_tree
  end

  def build_tree(arr)
    arr = arr.uniq.sort
  end
end
