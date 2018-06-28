require_relative 'kernel'
require_relative 'integer'

module RubyWalker
  class Evaluator
    def initialize(stdout: STDOUT, stderr: STDERR)
      @kernel = RubyWalker::Kernel.new(stdout: stdout, stderr: stderr)
    end

    def evaluate(node, stack)
      case node.type
      when 'NODE_SCOPE'
        # TODO 内容見る
        return evaluate(node.children[2], stack)
      when 'NODE_FCALL'
        mid = node.children[0]
        args = evaluate(node.children[1], stack)
        # TODO self は常に Kernel とは限らない
        if @kernel.respond_to?(mid)
          return @kernel.public_send(mid, *args)
        else
          raise "No such method: Kernel##{mid}"
        end
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
        return recv.call(mid, *args)
      when 'NODE_LIT'
        return to_literal(node.children.first)
      else
        raise "Unknown node type #{node.type}"
      end
    end

    private

    def to_literal(val)
      case val
      when ::Integer
        RubyWalker::Integer.new(val)
      else
        raise "Unknown literal type: #{val.inspect}"
      end
    end
  end
end
