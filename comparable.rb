# frozen_string_literal: true

# bonus: compare nodes using data.
module Comparable
  def compare(nodes, &oper)
    comparable = extract_data(nodes)

    oper.call(comparable)
  end

  def extract_data(nodes)
    nil_to_zero = proc { |data| data = 0 if data.nil? }

    nodes.map { |node| nil_to_zero.call(node.data) }
  end

  def same?(node)
    comparable = extract_data([self, node])

    comparable[0] == comparable[1]
  end

  def less_than?(node)
    @data < node.data
  end

  def greater_than?(node)
    return if @data.nil? || same?(node)

    !less_than?(node)
  end
end
