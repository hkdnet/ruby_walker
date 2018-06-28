require_relative 'base_literal'

module RubyWalker
  class False < BaseLiteral
    def initialize(val)
      @val = val
    end

    def class
      ::RubyWalker::True
    end

    def to_s
      'false'
    end
  end
end
