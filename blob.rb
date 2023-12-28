# frozen_string_literal: true

require 'pry-byebug'

# helper fns
module Helpers
  # sanitize input by deduplicating and sorting array destructively.
  def clean(arr)
    arr.empty? && [] || arr.uniq.sort
  end

  def print_tree(node = @root, prefix = '', is_left = true)
    return unless node

    if node.is_a?(Tree)
      print_tree(node.root, prefix, is_left)
    else
      print_tree(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      print_tree(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
  end
end

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

# ordered collection of nodes
# all values to left of root node are less
# all values to right of root node are greater
class Tree
  include Helpers
  attr_reader :arr, :root

  def initialize(arr = nil)
    @arr = clean(arr)
    @root = build_tree(@arr)
  end

  private

  attr_writer :arr, :root

  def left_side(arr, mid)
    arr[..mid - 1]
  end

  def right_side(arr, mid)
    arr[mid + 1..]
  end

  def build_tree(arr)
    arr = clean(arr)
    if arr.empty?
      return
    elsif arr.length == 1
      @root = Node.new(arr[0])
    else
      mid = arr.length / 2.floor
      @root = Node.new(arr[mid])
      left_child = left_side(arr, mid)
      right_child = right_side(arr, mid)
      @root.left = Tree.new(left_child)
      @root.right = Tree.new(right_child)
    end

    @root
  end
end

foo = Array.new(15) { rand(1..100) }
bar = Tree.new(foo)

bar.print_tree
