module Stray
  class Environment
    attr_reader :context
    attr_reader :block

    def initialize(context:, block: nil)
      @context = context
      @local_variables = {}
      @block = block
    end

    def assign_local_variable(name, val)
      @local_variables[name] = val
    end

    def get_local_variable(name)
      @local_variables[name]
    end

    def local_variable_defined?(name)
      @local_variables.key?(name)
    end

    # @param method [::Stray::Method]
    def add_method(method)
      @context.rb_define_method(method)
    end

    def new_env
      ::Stray::Environment.new(context: @context, block: @block)
    end

    def with_block(block)
      orig_block = @block
      @block = block
      ret = yield self
      @block = orig_block
      ret
    end
  end
end
