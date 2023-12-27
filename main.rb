require_relative 'tree'
require_relative 'node'
require_relative 'pretty_print'

foo = [1, 2, 3]
bar = Tree.new(foo)

bar.pretty_print
