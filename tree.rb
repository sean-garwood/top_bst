# frozen_string_literal: true

# Build BST from an array.
class Tree
include Comparable
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

  def insert(data)
    case
    when less_than?(data, @root.data)
    end

    # some code
  end

  private

  attr_writer :arr, :root

  def build_tree(arr)
    mid = arr.length / 2.floor
    root_node = Node.new(arr[mid])
    return root_node if mid.zero?

    root_node.left = build_tree(arr[..mid - 1])
    root_node.right = build_tree(arr[mid + 1..])
    root_node
  end
end
