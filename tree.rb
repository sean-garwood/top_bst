# frozen_string_literal: true

require_relative 'comparable'
# Build BST from an array.
class Tree
  include Comparable
  attr_accessor :root
  attr_reader :arr

  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # FIXIT
  def insert(data)
    new_node = Node.new(data)
    return @root = new_node if @root.nil?
    return if same?(new_node, @root)

    parent = find_parent(new_node)
  end

  private

  attr_writer :arr

  def build_tree(arr)
    mid = arr.length / 2.floor
    node = Node.new(arr[mid])
    return node if mid.zero?

    node.left = build_tree(arr[..mid - 1]) unless arr[..mid - 1].empty?
    node.right = build_tree(arr[mid + 1..]) unless arr[mid + 1..].empty?
    node
  end

  # FIXIT
  def find_parent(node)
    return nil if less_than?(node, @root)

  end

end
