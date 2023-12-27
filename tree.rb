# frozen_string_literal: true

# ordered collection of nodes
# all values to left of root node are less
# all values to right of root node are greater
class Tree
  include PrettyPrint
  attr_accessor :arr, :root

  def initialize(arr = nil)
    @arr = clean(arr)
    @root = build_tree(@arr)
  end

  def clean(arr)
    empty = proc { nil }
    empty.call && arr.nil? || arr.uniq.sort
  end

  def build_tree(arr)
    arr = clean(arr)
    mid = arr.length / 2.floor
    @root = Node.new(arr[mid])
    unless mid.zero?
      @root.left = build_tree(arr[0..mid - 1].reject(&:nil?)) unless mid.zero?
      @root.right = build_tree(arr[mid + 1..].reject(&:nil?)) unless mid.zero?
    end
    @root
  end
end
