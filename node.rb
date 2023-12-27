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
  # given an array of values, create a tree
  def initialize(arr = nil)
    @arr = arr
    # need to find the middle of the sorted arr to set the root index
    @root = root_of_tree(arr)
  end

  def clean(arr)
    return nil if array.nil?

    arr.uniq.sort
  end

  def find_middle_index(arr)
    clean(arr).(length / 2).floor
  end

  def root_of_tree(arr)
    Node.new(arr[find_middle_index(arr)])
  end

  def one_left(index)
    index - 1
  end

  def one_right(index)
    index + 1
  end

  def halves(arr)
    # remove root, left and right from arr, return halves
    mid = find_middle_index(arr)
    left = one_left(mid)
    right = one_right(mid)
    [arr[0..left - 1], arr[right + 1..]]
  end

  def build_base(root, left, right)
    # need to recursively do the following:
      # 1. clean array input
      # 2. find middle index of array
      # 3. create a Tree instance with
  end

  def build_tree(three_element_arr)
    three_element_arr.each { |e| Node.new(e)}
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
