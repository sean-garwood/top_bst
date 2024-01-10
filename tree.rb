# frozen_string_literal: true

require_relative 'comparable'
require_relative 'search'
require_relative 'node'
# Build BST from an array.
class Tree
  include Comparable
  include Search
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

  def insert(data)
    new_node = Node.new(data)
    return @root = new_node if empty?

    find_parent(new_node).make_baby(new_node)
  end

  def empty?
    @root.nil?
  end

  private

  attr_writer :arr

  def build_tree(arr)
    mid = arr.length / 2
    node = Node.new(arr[mid])
    return node if mid.zero?

    left_side = arr[..mid - 1]
    right_side = arr[mid + 1..]
    node.left = build_tree(left_side)
    node.right = build_tree(right_side) unless right_side.empty?
    # for some reason,
    # `unless mid.zero?` clause here cuts off the greatest element.
    node
  end
end
