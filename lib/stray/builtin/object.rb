require_relative 'basic_object'
require_relative 'kernel'

module Stray
  module Builtin
    class Object < ::Stray::Builtin::BasicObject
      include ::Stray::Builtin::Kernel

      def send(name, *args, &blk)
        __send__(name, *args, &blk)
      end

      def class
        ::Stray::Builtin::Object
      end

      def to_s
        ::Stray::Builtin::String.new(rb_to_s)
      end

      def rb_to_s
        '#<Object>'
      end
    end
  end
end
