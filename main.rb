require 'pry'
require './lib/ruby_walker'

unless ARGV.first
  abort <<~MSG
    Usage: ruby #$0 FILE
  MSG
end
RubyWalker::Walker.new(ARGV.first).walk
