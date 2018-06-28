require_relative 'basic_object'

module RubyWalker
  class Nil < BasicObject
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
