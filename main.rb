require 'pry'
require './lib/ruby_walker'

RubyWalker::Walker.new('./foo.rb').walk
