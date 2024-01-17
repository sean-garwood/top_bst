# frozen_string_literal: true

# Build BST from an array.
class Tree
  include Comparable
  include Edit
  include PrettyPrintz
  include Search
  include Traverse
  attr_accessor :root
  attr_reader :arr, :leftmost, :rightmost, :levels

  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
    @leftmost = go_furthest(&:left)
    @rightmost = go_furthest(&:right)
    @levels = [depth(leftmost), depth(rightmost)].max
  end

  def depth(node, curr = @root)
    return 0 if curr.leaf? || node.same?(curr)

    d = 1
    any_kids_same = ->(n, c) { c.kids.call.any? { |k| n.same?(k) } }
    until node.same?(curr) || any_kids_same.call(node, curr)
      return d + 1 if any_kids_same.call(node, curr)

      d += 1
      if curr.one_child?
        curr = curr.kids.call[0]
      else
        node.greater_than?(curr) ? curr = curr.right : curr = curr.left
      end
    end
    d
  end

  def balanced?

    # find height of left and right subtrees
    subtree_height_diff = (@root.right.height - @root.left.height).abs
    subtree_height_diff == 1 || subtree_height_diff.zero?
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
