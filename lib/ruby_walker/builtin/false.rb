require_relative 'basic_object'

module RubyWalker
  module Builtin
    class False < ::RubyWalker::Builtin::BasicObject
      def initialize(val)
        @val = val
      end

      def class
        ::RubyWalker::Builtin::False
      end

      def to_s
        'false'
      end
    end
  end
end
