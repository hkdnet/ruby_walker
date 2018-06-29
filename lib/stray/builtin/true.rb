require_relative 'object'

module Stray
  module Builtin
    class True < ::Stray::Builtin::Object
      def initialize(val)
        @val = val
      end

      def class
        ::Stray::Builtin::True
      end

      def rb_to_s
        'true'
      end
    end
  end
end
