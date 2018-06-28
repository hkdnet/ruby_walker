require_relative 'basic_object'

module RubyWalker
  module Builtin
    class Symbol < ::RubyWalker::Builtin::BasicObject
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def to_s
        val.to_s
      end

      def class
        ::RubyWalker::Builtin::Symbol
      end
    end
  end
end
