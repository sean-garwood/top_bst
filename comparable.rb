# frozen_string_literal: true

# compare nodes using data.
module Comparable
  def compare(nodes)
    clean_data = ->(node) { node.data.nil? ? 0 : node.data }

    nodes = nodes.map { |node| clean_data.call(node) }
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
