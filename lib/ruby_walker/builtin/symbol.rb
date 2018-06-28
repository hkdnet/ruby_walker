require_relative 'object'

module RubyWalker
  module Builtin
    class Symbol < ::RubyWalker::Builtin::Object
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def rb_to_s
        val.to_s
      end

      def class
        ::RubyWalker::Builtin::Symbol
      end
    end
  end
end
