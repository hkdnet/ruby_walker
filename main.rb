require 'pry'
require './lib/ruby_walker'

result = RubyWalker::Walker.new('./foo.rb').walk

puts "評価結果"
p result
