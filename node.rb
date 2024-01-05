# frozen_string_literal: true

# element in a binary search tree.
# contains @data, which is a value, and two pointers: @left and @right, which
# point to the @root of the child nodes
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def leaf?
    @left.nil? && @right.nil?
  end

  def find_next(node, current)
    return if current.leaf?

    less_than?(node, current) || current.right.nil? ? current.left : current.right
  end

  def make_baby(child)
    less_than?(child, self) ? self.left = child : self.right = child
  end
end
