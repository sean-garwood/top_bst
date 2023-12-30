# frozen_string_literal: true

# bonus: compare nodes using data.
module Comparable
  def same?(node_a, node_b)
    node_a.data == node_b.data
  end

  def less_than?(node_a, node_b)
    node_a.data < node_b.data
  end

  def greater_than?(node_a, node_b)
    !less_than?(node_a, node_b)
  end

  def found_neighbors?(new_node, last_node, current_node)
    greater_than?(new_node


end
