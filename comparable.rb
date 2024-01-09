# frozen_string_literal: true

# compare nodes using data.
module Comparable
  def compare(nodes)
    nil_to_zero = ->(node) { node.nil? || node.data = 0 }

    nodes.map { |node| nil_to_zero.call(node) }.sort
    nodes[0] <=> nodes[1]
  end

  def same?(other)
    compare([self, other]).zero?
  end

  def less_than?(other)
    compare([self, other]).negative?
  end

  def greater_than?(other)
    compare([self, other]).positive?
  end
end
