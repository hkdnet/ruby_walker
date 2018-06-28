require_relative 'evaluator'

module RubyWalker
  class Walker
    def initialize(file_path, logger: nil)
      @file_path = file_path
      @evaluator = RubyWalker::Evaluator.new
    end

    def walk
      ast = RubyVM::AST.parse_file(@file_path)
      @evaluator.evaluate(ast, [])
    end
  end
end
