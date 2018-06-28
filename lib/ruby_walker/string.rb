require_relative 'base_literal'

module RubyWalker
  class String < RubyWalker::BaseLiteral
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
