# frozen_string_literal: true

#bonus: compare nodes using data.
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
  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end
