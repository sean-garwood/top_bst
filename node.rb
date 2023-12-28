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

end
