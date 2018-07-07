require 'set'

module Stray
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

        def user_defined_methods
          @user_defined_methods ||= {}
        end
      end

      def rb_respond_to?(name)
        self.class.instance_methods.include?(name)
      end

      # @param method [::Stray::Method]
      def rb_define_method(method)
        user_defined_methods[method.name] = method
      end

      def user_defined_methods
        self.class.user_defined_methods
      end

      # @param [Symbol] mid
      # @param [::Stray::Builtin::Array] args
      def call(mid, args)
        if rb_respond_to?(mid)
          self.__send__(mid, *args.val)
        else
          raise "No such method for #{self.class}##{mid}"
        end
      end
    end
  end
end
