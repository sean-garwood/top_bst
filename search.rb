# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def find_next(node, current)
    return if current.leaf?

    less_than?(node, current) || current.right.nil? ? current.left : current.right
  end

  def find_parent(child, current)
    loop do
      current = find_next(child, current)
      break if current.leaf?
    end
    current
  end

  def find(value)
    return if value.nil? || empty?

    node = Node.new(value)
    current = @root
    loop do
      current = find_next(node, current)
      break if same?(node, current) || current.leaf?
    end
    same?(current, node) ? current : nil
  end
end
