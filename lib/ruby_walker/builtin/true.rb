require_relative 'basic_object'

module RubyWalker
  module Builtin
    class True < ::RubyWalker::Builtin::BasicObject
      def initialize(val)
        @val = val
      end

      def class
        ::RubyWalker::Builtin::True
      end

      def to_s
        'true'
      end
    end
  end
end
