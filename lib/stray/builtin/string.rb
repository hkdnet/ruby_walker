require_relative 'object'

module Stray
  module Builtin
    class String < ::Stray::Builtin::Object
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def rb_to_s
        val.to_s
      end

      def class
        ::Stray::Builtin::String
      end
    end
  end
end
