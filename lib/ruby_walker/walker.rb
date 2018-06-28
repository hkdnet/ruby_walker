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
      @evaluator.evaluate(ast, ::RubyWalker::Environment.new)
    end
  end
end
