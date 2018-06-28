require_relative 'basic_object'

module RubyWalker
  module Builtin
    class String < ::RubyWalker::Builtin::BasicObject
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def to_s
        val.to_s
      end

      def class
        ::RubyWalker::Builtin::String
      end
    end
  end
end
