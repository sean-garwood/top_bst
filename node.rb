# frozen_string_literal: true

# element in a binary search tree.
# contains @data, which is a value, and two pointers: @left and @right, which
# point to the @root of the child nodes
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def leaf?
    @left.nil? && @right.nil?
  end

  # FIXIT
  def direction(node, current)
    return if current.leaf?

    return :left if less_than?(node, current) || current.right.nil?

    :right
  end

  def make_baby(child)
    less_than?(self, child) ? child.left = self : child.right = self
  end
end
