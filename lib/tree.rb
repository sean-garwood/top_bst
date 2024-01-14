# frozen_string_literal: true

# Build BST from an array.
class Tree
  include Comparable
  include Edit
  include PrettyPrintz
  include Search
  include Traverse
  attr_accessor :root
  attr_reader :arr, :leftmost, :rightmost

  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
    @leftmost = go_furthest(&:left)
    @rightmost = go_furthest(&:right)
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

  def go_furthest(curr = @root, &dir)
    curr = dir.call(curr) until dir.call(curr).nil?

    curr
  end
end
