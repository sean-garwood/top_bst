# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def find_next(node, current)
    return if current.leaf?

    less_than?(node, current) || current.right.nil? ? current.left : current.right
  end

  def browse_tree(node, current = @root, &breaker)
    loop do
      current = find_next(node, current)
      break if breaker.call
    end
    current
  end

  def find(value)
    return if value.nil? || empty?

    node = Node.new(value)
    same_or_bust = ->(a, b) { same?(node, current) || current.leaf? }
    current = browse_tree(node, same_or_bust)
    same?(current, node) ? current : nil
  end

  def find_parent(child, current = @root)
    check_if_leaf = ->(node) { node.leaf? }
    browse_tree(child, check_if_leaf)
  end
end
