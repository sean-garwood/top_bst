# frozen_string_literal: true

# remove/insert data from tree
module Edit
  def insert(data)
    new_node = Node.new(data)
    return @root = new_node if empty?

    parent = scan_for(new_node, &:leaf?)
    parent.same?(new_node) ? nil : parent.make_baby(new_node)
  end

  def delete(data)
    return if empty? || find(data).nil?

    del = find(data)
    in_order = ->(kids) { kids[0].less_than?(kids[1]) ? kids : kids.reverse }
    parent = scan_for(del) { |curr| curr.parent_of?(del) }
    orphans = in_order.call(del.kids.call) unless del.leaf?
    if del.leaf?
      del.greater_than?(parent) ? parent.right = nil : parent.left = nil
    elsif del.one_child?
      parent.make_baby(orphans.compact[0])
    else
      del.greater_than?(parent) ? parent.right = orphans[0] : parent.left = orphans[0]
      orphans[0].right = orphans[1]
    end
    del
  end
end
