require 'pry'

class RubyWalker
  def initialize(filepath)
    @filepath = filepath
  end

  def walk
    ast = RubyVM::AST.parse_file(@filepath)
    p execute(ast, [])
  end

  def execute(node, stack)
    case node.type
    when 'NODE_SCOPE'
      # TODO 内容見る
      return execute(node.children[2], stack)
    when 'NODE_FCALL'
      mid = node.children[0]
      args = execute(node.children[1], stack)
      return [:called, :self, mid, args]
    when 'NODE_ARRAY'
      return node.children[0..-2].map do |e|
        execute(e, [])
      end
    when 'NODE_OPCALL'
      unless node.children.size == 3
        raise 'opcall は要素3つだと思ってたけどそうじゃないかも'
      end
      recv = execute(node.children[0], [])
      mid = node.children[1]
      args = execute(node.children[2], [])
      return [:called, recv, mid, args]
    when 'NODE_LIT'
      return node.children.first
    else
      binding.pry
      raise "Unknown node type #{node.type}"
    end
  end
end

RubyWalker.new('./foo.rb').walk
