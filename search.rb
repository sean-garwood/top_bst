# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def next_node(node, curr = @root)
    return if curr.leaf?

    node.less_than?(curr) ? curr.left : curr.right
  end

  def scan_tree(node, curr = @root)
    loop do
      curr = next_node(node, curr)
      break if yield(curr)
    end
    curr
  end

  def find(value)
    return if empty?

    proxy = Node.new(value)
    closest = scan_tree(proxy) { |curr| (curr.leaf? || proxy.same?(curr)) }
    closest.same?(proxy) && closest || nil
  end
end
