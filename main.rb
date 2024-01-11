# frozen_string_literal: true

require_relative 'lib/comparable'
require_relative 'lib/pretty_print'
require_relative 'lib/search'

require_relative 'lib/node'
require_relative 'lib/tree'

series = proc { |len| Tree.new(Array(1..len)) }
random = proc { |len, min, max| Tree.new(Array.new(len) { rand(min..max) }) }

foo = random.call(256, 1, 99999)

foo.pretty_print
foo.delete(foo.root.right.data)
foo.pretty_print
