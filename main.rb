# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

foo = Array.new(4) { rand(1..100) }
bar = Tree.new(foo)

puts "initial tree\n#{bar.pretty_print}\n\n"
bar.insert(-1)
puts "modified tree\n#{bar.pretty_print}\n\n"
