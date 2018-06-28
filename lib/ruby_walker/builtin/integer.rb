require_relative 'object'

module RubyWalker
  module Builtin
    class Integer < ::RubyWalker::Builtin::Object
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def +(other)
        ::RubyWalker::Builtin::Integer.new(val + other.val)
      end

      def to_s
        val.to_s
      end

      def class
        ::RubyWalker::Builtin::Integer
      end
    end
  end
end
