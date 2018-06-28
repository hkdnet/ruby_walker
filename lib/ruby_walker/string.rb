require_relative 'basic_object'

module RubyWalker
  class String < RubyWalker::BasicObject
    attr_reader :val

    def initialize(val)
      @val = val
    end

    def to_s
      val.to_s
    end

    def class
      ::RubyWalker::String
    end
  end
end
