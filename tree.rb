# frozen_string_literal: true

require_relative 'comparable'
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
    new_node = Node.new(data)
    return @root = new_node if @root.nil?
    return if same?(new_node, @root)

    parent = find_parent(new_node)
    parent <=> new_node.negative? ? parent.left = new_node : parent.right = new_node
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

  def find_parent(node)
    parent = @root
    current = parent
    next_node = proc { less_than?(current, node) ? current.left : current.right }
    until greater_than?(node, parent) && less_than?(node, next_node)
      parent = current
      current = next_node.call
    end
    parent
  end
end
