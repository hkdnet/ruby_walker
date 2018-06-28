require_relative 'basic_object'

module RubyWalker
  class True < BasicObject
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
