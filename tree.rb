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

    parent = stop_at(new_node, &:leaf?)
    parent.same?(new_node) ? nil : parent.make_baby(new_node)
  end

  def delete(value)
    return if find(value).nil?

    # consider what happens:
    #   node is a leaf
    #   node has one child
    #   node has two children

    # node is leaf
    #   delete node from tree
    #   set parent.[dir] = nil
    # dir = last direction
    # curr = node thatt

    # need to remember parent, or last visited element, then set any children
    # equal to node to nil

    # node has one child
    #   replace deleted node with its child
    #     set del.parent = del.child

    # node has two children
    #   find 'inorder' successor of node
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
