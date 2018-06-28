require_relative 'basic_object'

module RubyWalker
  class False < BasicObject
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
