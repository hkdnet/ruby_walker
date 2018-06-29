require_relative 'object'

module Stray
  module Builtin
    class Nil < ::Stray::Builtin::Object
      def initialize(val)
        @val = val
      end

      def class
        ::Stray::Builtin::Nil
      end

      def rb_to_s
        ''
      end
    end
  end
end
