# frozen_string_literal: true

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

    parent = scan_tree(new_node, &:leaf?)
    parent.same?(new_node) ? nil : parent.make_baby(new_node)
  end

  def delete(data)
    return if empty? || find(data).nil?

    # either find the node or don't.

    del = find(data)
    # need to remember parent, or last visited element, then set any children
    # equal to node to nil
    parent = scan_tree(del) { |curr| curr.parent_of?(del) }

    # three cases:
    #   node is a leaf
    #   node has one child
    #   node has two children

    # node is leaf
    if del.leaf?
      parent.less_than?(del) ? parent.right = nil : parent.left = nil
    else
      puts 'fail'
    end

    # node has one child
    # elsif del.one_child?
    #   @del.right.nil? ? parent


    # node has one child
    #   replace deleted node with its child
    #     set del.parent = del.child

    # node has two children
    #   find 'inorder' successor of node
    del
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

    node.left = build_tree(arr[..mid - 1]) unless arr[..mid - 1].empty?
    node.right = build_tree(arr[mid + 1..]) unless arr[mid + 1..].empty?
    node
  end
end
