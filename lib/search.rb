# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def next_node(node, curr = @root)
    return if curr.leaf?

    node.less_than?(curr) ? curr.left : curr.right
  end

  def scan_tree(node, curr = @root)
    return curr if yield(curr)

    loop do
      curr = next_node(node, curr)
      break if yield(curr)
    end
    curr
  end

  def find(data)
    return if empty?

    node = Node.new(data)
    closest = scan_tree(node) { |curr| (curr.leaf? || node.same?(curr)) }
    closest.same?(node) && closest || nil
  end
end
