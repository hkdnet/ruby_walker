require_relative 'basic_object'

module RubyWalker
  module Builtin
    module Kernel
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
    end
  end
end
