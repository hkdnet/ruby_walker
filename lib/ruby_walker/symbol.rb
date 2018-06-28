require_relative 'base_literal'

module RubyWalker
  class Symbol < RubyWalker::BaseLiteral
    attr_reader :val

    def initialize(val)
      @val = val
    end

    def to_s
      val.to_s
    end

    def class
      ::RubyWalker::Symbol
    end
  end
end
