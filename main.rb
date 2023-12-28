# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

foo = Array.new(15) { rand(1..100) }
bar = Tree.new(foo)

bar.print_tree
