require 'set'

module RubyWalker
  module Builtin
    # 不必要なメソッドを定義したくないので BasicObject を継承して自前で定義することにする
    class BasicObject < ::BasicObject
      class << self
        # @override
        def method_added(name)
          instance_methods << name
          super
        end

        def instance_methods
          @instance_methods ||= Set.new
        end
      end

      def respond_to?(name)
        self.class.instance_methods.include?(name)
      end

      def class
        Kernel.send(:raise, ::NotImplementedError)
      end

      def call(mid, *args)
        if respond_to?(mid)
          self.__send__(mid, *args)
        else
          raise "No such method for #{self.class}##{mid}"
        end
      end
    end
  end
end
