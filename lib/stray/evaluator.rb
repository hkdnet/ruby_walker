require_relative 'builtin/object'
require_relative 'builtin/nil'
require_relative 'builtin/true'
require_relative 'builtin/false'
require_relative 'builtin/integer'
require_relative 'builtin/string'
require_relative 'builtin/symbol'
require_relative 'builtin/array'
require_relative 'method'

module Stray
  class Evaluator
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
        c = evaluate(cond, environment)
        unless c == ::Stray.world.false
          return evaluate(t, environment)
        else
          return evaluate(f, environment)
        end
      when 'NODE_FCALL'
        mid = node.children[0]
        args = node.children[1] ? evaluate(node.children[1], environment) : []

        new_env = environment.new_env
        method = environment.context.user_defined_methods[mid]

        if method
          method.arg_hash(args).each do |k, v|
            new_env.assign_local_variable(k, v)
          end
          return evaluate(method.body, new_env)
        end

        if environment.context.rb_respond_to?(mid)
          return environment.context.send(mid, *args.val)
        else
          raise "No such method: Kernel##{mid}"
        end
      when 'NODE_VCALL'
        mid = node.children.first
        new_env = environment.new_env

        method = environment.context.user_defined_methods[mid]
        if method
          return evaluate(method.body, new_env)
        else
          raise "not implemented"
        end
      when 'NODE_OPCALL'
        recv = evaluate(node.children[0], environment)
        mid = node.children[1]
        args = evaluate(node.children[2], environment)
        return recv.call(mid, *args)
      when 'NODE_DVAR'
        return environment.get_local_variable(node.children.first)
      when 'NODE_LIT'
        return to_literal(node.children.first)
      when 'NODE_ARRAY'
        val = node.children[0..-2].map do |e|
          evaluate(e, environment)
        end
        return ::Stray::Builtin::Array.new(val)
      when 'NODE_STR'
        return ::Stray::Builtin::String.new(node.children.first)
      when 'NODE_NIL'
        return ::Stray.world.nil
      when 'NODE_TRUE'
        return ::Stray.world.true
      when 'NODE_FALSE'
        return ::Stray.world.false
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
      when 'NODE_YIELD'
        raise "No block given!" unless environment.block

        args = evaluate(node.children.first, environment)
        arg_names, _arity, body = environment.block.children

        new_env = environment.new_env

        arg_names.zip(args).each do |k, v|
          new_env.assign_local_variable(k, v)
        end
        return evaluate(body, new_env)
      when 'NODE_DEFN'
        mid, scope = node.children
        args, arity, body = scope.children
        method = ::Stray::Method.new(name: mid, args: args, arity: arity, body: body)
        environment.add_method(method)
        return ::Stray::Builtin::Symbol.new(mid)
      when 'NODE_ITER'
        method_call, block = node.children
        return environment.with_block(block) do |new_env|
          evaluate(method_call, new_env)
        end
      else
        raise "Unknown node type #{node.type}"
      end
    end

    private

    def to_literal(val)
      case val
      when ::Integer
        ::Stray::Builtin::Integer.new(val)
      when ::Symbol
        ::Stray::Builtin::Symbol.new(val)
      else
        raise "Unknown literal type: #{val.inspect}"
      end
    end
  end
end
