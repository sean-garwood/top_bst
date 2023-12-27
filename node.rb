# frozen_string_literal: true

require_relative 'comparable'
# represents a node on a binary search tree
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# ordered collection of nodes
# all values to left of root node are less
# all values to right of root node are greater
class Tree
  attr_accessor :arr, :root

  def initialize(arr = nil)
    arr = clean(arr)
    @arr = arr
    @root = root_of_tree(arr)
  end

  def clean(arr)
    return nil if arr.nil?

    arr.uniq.sort
  end

  def find_middle_index(arr)
    arr.length / 2.floor
  end

  def root_of_tree(arr)
    middle_index = find_middle_index(arr)
    Node.new(arr[middle_index])
  end

  def one_left(index)
    index - 1
  end

  def one_right(index)
    index + 1
  end
end
# high-level

# given an arbitrary array, build a balanced binary search tree consisting of
# its elements, where the middle element is the root, and all the elements to
# the left of root are less than root, and those to the right are greater than
# root.

# take array, check if nil
# remove duplicates
# sort array, return

# get middle element
# set as root of Tree

# remove this element from the array

# thinking of storing these in a three-element array and using this as a
# recursive way to build the tree, where:

# l0: root = mid element, left = left of root_l0, right = right_of_root_l0
# l1: two trees: left and right

#   tree one:

#   t1_l1 root: left_l0
#   t1_l1 left = left of root_t1_l1
#   t1_l1 right = root_l0

#   tree two:

#   t1_r1 root = right_l0
#   t1_r1 left = root_l0
#   t1_r1 right = right of root_t2_l1
