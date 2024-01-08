# frozen_string_literal: true

# bonus: compare nodes using data.
module Comparable
  def same?(node)
    @data == node.data
  end

  def less_than?(node)
    @data < node.data unless same?(node)
  end

  def greater_than?(node)
    !less_than?(node) unless same?(node)
  end
end
