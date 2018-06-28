require_relative 'base_literal'

module RubyWalker
  class Nil < BaseLiteral
    def initialize(val)
      @val = val
    end

    def class
      ::RubyWalker::Nil
    end

    def to_s
      ''
    end
  end
end
