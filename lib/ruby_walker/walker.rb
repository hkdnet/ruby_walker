require_relative 'evaluator'
require_relative 'environment'

module RubyWalker
  class Walker
    def initialize(file_path)
      @file_path = file_path
      @evaluator = RubyWalker::Evaluator.new
    end

    def walk
      ast = RubyVM::AST.parse_file(@file_path)

      main = ::RubyWalker::Builtin::Object.new
      env = ::RubyWalker::Environment.new(context: main)
      @evaluator.evaluate(ast, env)
    end
  end
end
