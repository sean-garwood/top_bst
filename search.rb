# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def stop_at(node, current = @root)
    loop do
      current = find_next(node, current)
      break if yield(current)
    end
    current
  end

  def find_next(node, current = @root)
    return if current.leaf?

    node.less_than?(current) || current.right.nil? ? current.left : current.right
  end

  def find_parent(child)
    stop_at(child, &:leaf?)
  end

  def find(value)
    return if empty?
    return @root if same?(@root.data, value)

    node = Node.new(value)
    stop_at(node) { |current| current.leaf? || same?(node, current) }
  end
end
