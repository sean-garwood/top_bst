# frozen_string_literal: true

# bonus: compare nodes using data.
module Comparable
  def same?(node)
    return if node.nil? && !@data.nil?

    @data == node.data || @data.nil? && node.data.nil?
  end

  def less_than?(node)
    return if same?(node) || @data.nil?

    node.data.nil? || node.data < @data
  end

  def greater_than?(node)
    return if @data.nil? || same?(node)

    !less_than?(node)
  end
end
