require 'set'

module RubyWalker
  module Builtin
    # 不必要なメソッドを定義したくないので BasicObject を継承して自前で定義することにする
    class BasicObject < ::BasicObject
      class << self
        # @override
        def include(mod)
          super.tap do
            mod.instance_methods.each { |e| instance_methods << e }
          end
        end

        # @override
        def method_added(name)
          instance_methods << name
          super
        end

        def instance_methods
          @instance_methods ||= Set.new
        end
      end

      def rb_respond_to?(name)
        self.class.instance_methods.include?(name)
      end

      def call(mid, *args)
        if rb_respond_to?(mid)
          self.__send__(mid, *args)
        else
          raise "No such method for #{self.class}##{mid}"
        end
      end
    end
  end
end
