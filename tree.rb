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
    return if same?(data, @root.data)

    new_node = Node.new(data)
    # store the last node that was compared so its left/right attrib can be
    #    modified when the proper placement is found for the new node
    last = @root
    current = last
    # proc to send different nodes to compare to a block that returns the next
    # node: left if
    next_node = proc do
      less_than?(current, new_node) ? current.left : current.right
    end
    # need to set last.left or right depending on last path taken

    end
    # what to do after we find neighbors?
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
