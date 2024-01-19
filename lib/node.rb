# frozen_string_literal: true

# element in a binary search tree.
class Node
  include Comparable
  include PrettyPrintz
  include Search
  include Traverse
  attr_accessor :data, :left, :right
  attr_reader :kids

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @kids = -> { [@left, @right] }
  end

  def height
    return -1 if data.nil?

    lh = @left.nil? && -1 || @left.height
    rh = @right.nil? && -1 || @right.height
    [lh, rh].max + 1
  end

  def leaf?
    @left.nil? && @right.nil?
  end

  def one_child?
    @left.nil? || @right.nil?
  end

  def parent_of?(child)
    if leaf?
      nil
    elsif one_child?
      @left.nil? ? @right.same?(child) : @left.same?(child)
    else
      @left.same?(child) || @right.same?(child)
    end
  end
end
