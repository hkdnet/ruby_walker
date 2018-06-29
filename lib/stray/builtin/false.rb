require_relative 'object'

module Stray
  module Builtin
    class False < ::Stray::Builtin::Object
      def initialize(val)
        @val = val
      end

      def class
        ::Stray::Builtin::False
      end

      def rb_to_s
        'false'
      end
    end
  end
end
