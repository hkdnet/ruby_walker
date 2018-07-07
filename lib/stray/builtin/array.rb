require_relative 'object'

module Stray
  module Builtin
    class Array < ::Stray::Builtin::Object
      include ::Enumerable
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def [](key)
        @val[key]
      end

      def []=(key, val)
        @val[key] = val
      end

      def each(*args, &blk)
        @val.each(*args, &blk)
      end

      def rb_to_s
        "[#{val.map(&:rb_to_s).join(', ')}]"
      end

      def class
        ::Stray::Builtin::Array
      end
    end
  end
end
