# frozen_string_literal: true

# Build BST from an array.
class Tree
  attr_reader :arr, :root

  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  attr_writer :arr, :root

  def left_side(arr, mid)
    mid.zero? && nil || arr[..mid - 1]
  end

  def right_side(arr, mid)
    mid.zero? && nil || arr[mid + 1..]
  end

  def build_tree(arr)
    mid = arr.length / 2.floor
    root_node = Node.new(arr[mid])
    return root_node if mid.zero?

    root_node.left = build_tree(left_side(arr, mid))
    root_node.right = build_tree(right_side(arr, mid))
    root_node
  end
end
