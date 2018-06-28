require 'logger'

class RubyWalker
  def initialize(file_path, logger: nil)
    @file_path = file_path
    @logger = logger || Logger.new(STDOUT)
  end

  def walk
    ast = RubyVM::AST.parse_file(@file_path)
    result = evaluate(ast, [])
    debug result
  end

  def evaluate(node, stack)
    case node.type
      when 'NODE_SCOPE'
        # TODO 内容見る
        return evaluate(node.children[2], stack)
      when 'NODE_FCALL'
        mid = node.children[0]
        args = evaluate(node.children[1], stack)
        # TODO: send やめる
        return send(mid, *args)
      when 'NODE_ARRAY'
        return node.children[0..-2].map do |e|
          evaluate(e, [])
        end
      when 'NODE_OPCALL'
        unless node.children.size == 3
          raise 'opcall は要素3つだと思ってたけどそうじゃないかも'
        end
        recv = evaluate(node.children[0], [])
        mid = node.children[1]
        args = evaluate(node.children[2], [])
        # TODO: send やめる
        return recv.send(mid, *args)
      when 'NODE_LIT'
        # TODO: 自分でリテラルに対応するオブジェクトつくる
        return node.children.first
      else
        binding.pry
        raise "Unknown node type #{node.type}"
    end
  end

  private

  attr_reader :logger

  def debug(*args)
    logger.debug args
  end
end
