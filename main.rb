# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

foo = Array.new(4) { rand(1..100) }
bar = Tree.new(foo)

bar.pretty_print
