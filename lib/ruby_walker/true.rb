require_relative 'base_literal'

module RubyWalker
  class True < BaseLiteral
    def initialize(val)
      @val = val
    end

    def class
      ::RubyWalker::True
    end

    def to_s
      'true'
    end
  end
end
