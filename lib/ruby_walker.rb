require 'logger'
require_relative 'ruby_walker/walker'
require_relative 'ruby_walker/world'

module RubyWalker
  def world
    @world ||= RubyWalker::World.new
  end
end
