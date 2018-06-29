require_relative 'evaluator'
require_relative 'environment'

module Stray
  class Walker
    def initialize(file_path)
      @file_path = file_path
      @evaluator = Stray::Evaluator.new
    end

    def walk
      ast = RubyVM::AST.parse_file(@file_path)

      main = ::Stray::Builtin::Object.new
      env = ::Stray::Environment.new(context: main)
      @evaluator.evaluate(ast, env)
    end
  end
end
