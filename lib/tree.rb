# frozen_string_literal: true

# Build BST from an array.
class Tree
  include Comparable
  include PrettyPrintz
  include Search
  attr_accessor :root
  attr_reader :arr

  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
  end

  def insert(data)
    new_node = Node.new(data)
    return @root = new_node if empty?

    parent = scan_tree(new_node, &:leaf?)
    parent.same?(new_node) ? nil : parent.make_baby(new_node)
  end

  def delete(data)
    return if empty? || find(data).nil?

    del = find(data)
    in_order = ->(kids) { kids[0].less_than?(kids[1]) ? kids : kids.reverse }
    parent = scan_tree(del) { |curr| curr.parent_of?(del) }
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

  def level_order(&block)
    curr = @root
    collected = [@root]
    queue = []
    loop do
      curr.kids.call.each do |k|
        next if k.nil?

        queue << k
        collected << k
      end
      curr = queue.shift
      break if queue.empty?
    end
    return collected.map(&:data) unless block_given?

    yield collected.shift until collected.empty?
  end

  def empty?
    @root.nil?
  end

  private

  attr_writer :arr

  def build_tree(arr)
    mid = arr.length / 2
    node = Node.new(arr[mid])
    return node if mid.zero?

    node.left = build_tree(arr[..mid - 1]) unless arr[..mid - 1].empty?
    node.right = build_tree(arr[mid + 1..]) unless arr[mid + 1..].empty?
    node
  end
end
