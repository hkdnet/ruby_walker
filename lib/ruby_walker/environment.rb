module RubyWalker
  class Environment
    attr_reader :context

    def initialize(context:)
      @context = context
      @local_variables = {}
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

    # @param method [::RubyWalker::Method]
    def add_method(method)
      @context.rb_define_method(method)
    end
  end
end
