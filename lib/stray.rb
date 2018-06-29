require 'logger'
require_relative 'stray/walker'
require_relative 'stray/world'

module Stray
  class << self
    def world
      @world ||= Stray::World.new
    end
  end
end
