# frozen_string_literal: true

# bonus: compare nodes using data.
module Comparable
  def same_data?(node_a, node_b)
    node_a.data == node_b.data
  end

  def less_than?(node_a, node_b)
    node_a.data < node_b.data
  end
end
