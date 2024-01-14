# frozen_string_literal: true

# modules to traverse the tree in different orders:
#   level
#   pre
#   post
#   in
module Traverse
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

  def in_order(&block)

    stack = []
    coll = []
  end

  def stack_nodes
    # build a stack to yield to the blocks
  end

  def left_subtree

    # stack up the kids from the left side of the bst
  end

  def right_subtree
    # stack up kids from right side
  end
end

# dfs traversal methods

# inorder = Left -> node => right

# trav left sub
# root
# right

# remember, every node is either a leaf or the root of some subtree. so to check
# the nodes in our initial tree, we think of root.left and root.right as being
# the left_sub.root and right_sub.root of the subtrees of the initial tree.

# we therefore go left until we reach a node that does not have a left child and
# add it to the collection.
# then we add its parent to the collection, as well as parent.right.
# then we would traverse the children of parent.right
# a balanced bst will not have any more than one node after this step
