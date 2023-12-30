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
    return @root = Node.new(data) if @root.nil?
    return if same?(data, @root.data)

    new_node = Node.new(data)
    # store the last node that was compared so its left/right attrib can be
    #    modified when the proper placement is found for the new node
    # need to reset the prev. node's left or right attr
    #   if last < new, last.left = new
    #   if last > new, last.right = new
    parent = find_parent
    parent <=> new_node.negative? parent.left = new_node : parent.right = new_node
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

  def find_parent
    parent = @root
    current = last
    # proc to send different nodes to compare to a block that returns the next
    # node: left if
    next_node = proc do
      less_than?(current, new_node) ? current.left : current.right
    end
    # compare the current node and the new_node
    # update next_node and last until the following conditions are met:
    #   new_node > last
    #   new_node < next
    until greater_than?(new_node, parent) && less_than?(new_node, next_node)
      parent = current
      current = next_node.call
    end
end
