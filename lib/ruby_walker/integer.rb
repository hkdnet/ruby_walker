require_relative 'base_literal'

module RubyWalker
  class Integer < RubyWalker::BaseLiteral
    attr_reader :val

    def initialize(val)
      @val = val
    end

    def +(other)
      ::RubyWalker::Integer.new(val + other.val)
    end

    def to_s
      val.to_s
    end

    def class
      ::RubyWalker::Integer
    end
  end
end
