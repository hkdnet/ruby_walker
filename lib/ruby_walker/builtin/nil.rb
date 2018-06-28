require_relative 'basic_object'

module RubyWalker
  module Builtin
    class Nil < ::RubyWalker::Builtin::BasicObject
      def initialize(val)
        @val = val
      end

      def class
        ::RubyWalker::Builtin::Nil
      end

      def to_s
        ''
      end
    end
  end
end
