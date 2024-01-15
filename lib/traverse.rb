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

    block.call(collected.shift) until collected.empty?
  end

  # LNR
  def in_order(&block)
    return if nil?

    left.nil? || left.in_order(&block)
    block.call(self)
    right.nil? || right.in_order(&block)
  end

  # FIXIT - CRASHES PROGRAM
  # NLR
  def pre_order
    return if nil?

    block.call(self)
    left.nil? || left.in_order(&block)
    right.nil? || right.in_order(&block)
  end

  # FIXIT - CRASHES PROGRAM
  # LRN
  def post_order
    return if nil?

    left.nil? || left.in_order(&block)
    right.nil? || right.in_order(&block)
    block.call(self)
  end
end
