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

  def find(value)
    return if empty?

    node = Node.new(value)
    closest = stop_at(node) { |curr| (curr.leaf? || node.same?(curr)) }
    closest.same?(node) && closest || nil
  end
end
