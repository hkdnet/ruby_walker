require_relative 'kernel'
require_relative 'true'
require_relative 'integer'

module RubyWalker
  class Evaluator
    def initialize(stdout: STDOUT, stderr: STDERR)
      @kernel = RubyWalker::Kernel.new(stdout: stdout, stderr: stderr)
    end

    def evaluate(node, environment)
      case node.type
      when 'NODE_SCOPE'
        # TODO 内容見る
        return evaluate(node.children[2], environment)
      when 'NODE_BLOCK'
        # TODO これだけじゃダメなケースありそう
        ret = nil
        node.children.each do |child_node|
          ret = evaluate(child_node, environment)
        end
        return ret
      when 'NODE_IF'
        cond, t, f = node.children
        # とりあえず true だけ
        return evaluate(t, environment)
      when 'NODE_FCALL'
        mid = node.children[0]
        args = evaluate(node.children[1], environment)
        # TODO self は常に Kernel とは限らない
        if @kernel.respond_to?(mid)
          return @kernel.public_send(mid, *args)
        else
          raise "No such method: Kernel##{mid}"
        end
      when 'NODE_ARRAY'
        return node.children[0..-2].map do |e|
          evaluate(e, environment)
        end
      when 'NODE_OPCALL'
        unless node.children.size == 3
          raise 'opcall は要素3つだと思ってたけどそうじゃないかも'
        end
        recv = evaluate(node.children[0], environment)
        mid = node.children[1]
        args = evaluate(node.children[2], environment)
        return recv.call(mid, *args)
      when 'NODE_LIT'
        return to_literal(node.children.first)
      when 'NODE_TRUE'
        return ::RubyWalker::True.new(true)
      when 'NODE_LASGN'
        name = node.children[0]
        val = evaluate(node.children[1], environment)
        environment.assign_local_variable(name, val)
        return val
      when 'NODE_LVAR'
        name = node.children[0]
        if environment.local_variable_defined?(name)
          return environment.get_local_variable(name)
        else
          raise "No such local variable #{name}"
        end
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
