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

      def rb_to_s
        val.to_s
      end

      def class
        ::Stray::Builtin::Integer
      end
    end
  end
end
