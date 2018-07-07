require_relative 'object'

module Stray
  module Builtin
    class Integer < ::Stray::Builtin::Object
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def +(other)
        ::Stray::Builtin::Integer.new(val + other.val)
      end

      def rb_to_s(base = 10)
        val.to_s(base)
      end

      def class
        ::Stray::Builtin::Integer
      end

      def to_s(base = ::Stray::Builtin::Integer.new(10))
        ::Stray::Builtin::String.new(rb_to_s(base.val))
      end
    end
  end
end
