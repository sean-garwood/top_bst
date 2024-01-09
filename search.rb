# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def stop_at(node, curr = @root)
    loop do
      curr = find_next(node, curr)
      break if yield(curr)
    end
    curr
  end

  def find_next(node, curr = @root)
    return if curr.leaf?

    node.less_than?(curr) ? curr.left : curr.right
  end

  def find_parent(child)
    stop_at(child, &:leaf?)
  end

  def find(value)
    return if empty?
    return @root.data if value == @root.data

    node = Node.new(value)
    stop_at(node) { |curr| curr.leaf? || node == curr }.data
  end
end
