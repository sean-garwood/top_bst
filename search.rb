# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def direction(node, current)
    return if current.leaf?

    less_than?(node, current) || current.right.nil? ? -1 : 1
  end

  def find_parent(child, current)
    until current.leaf?
      dir = direction(child, current)
      dir.negative? && current = current.left || current = current.right
    end
    current
  end

  def find(value)
    return if value.nil? || empty?

    node = Node.new(value)
    current = @root
    until same?(node, current) || current.leaf?
      dir = direction(node, current)
      dir.negative? && current = current.left || current = current.right
    end
    current
  end
end
