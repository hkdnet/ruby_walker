require_relative 'basic_object'

module RubyWalker
  module Builtin
    class Object < ::RubyWalker::Builtin::BasicObject
      def send(name, *args, &blk)
        __send__(name, *args, &blk)
      end

      def class
        ::RubyWalker::Builtin::Object
      end
    end
  end
end
