# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

foo = Array.new(6) { rand(1..100) }
bar = Tree.new(foo)

puts "#{bar.pretty_print}\n\n"
