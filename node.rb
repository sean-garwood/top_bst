# frozen_string_literal: true

# represents a node on a binary search tree
class Node
  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end
