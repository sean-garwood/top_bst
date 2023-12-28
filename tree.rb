# frozen_string_literal: true

# Build BST from an array.
class Tree
  attr_reader :arr, :root

  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
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

  private

  attr_writer :arr, :root

  def left_side(arr, mid)
    arr[..mid - 1]
  end

  def right_side(arr, mid)
    arr[mid + 1..]
  end

  def build_tree(arr)
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
