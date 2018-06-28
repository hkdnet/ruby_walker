require_relative 'object'

module RubyWalker
  module Builtin
    class False < ::RubyWalker::Builtin::Object
      def initialize(val)
        @val = val
      end

      def class
        ::RubyWalker::Builtin::False
      end

      def rb_to_s
        'false'
      end
    end
  end
end
