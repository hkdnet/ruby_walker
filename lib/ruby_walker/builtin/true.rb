require_relative 'object'

module RubyWalker
  module Builtin
    class True < ::RubyWalker::Builtin::Object
      def initialize(val)
        @val = val
      end

      def class
        ::RubyWalker::Builtin::True
      end

      def rb_to_s
        'true'
      end
    end
  end
end
