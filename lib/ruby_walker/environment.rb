module RubyWalker
  class Environment
    def initialize
      @local_variables = {}
      @methods = {}
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
      @methods[method.name] = method
    end

    def method(name)
      @methods.fetch(name)
    end
  end
end
