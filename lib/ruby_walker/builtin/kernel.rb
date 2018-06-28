require_relative 'basic_object'

module RubyWalker
  module Builtin
    module Kernel
      def puts(*args)
        args.each do |e|
          RubyWalker.world.stdout.write(e)
          RubyWalker.world.stdout.write("\n")
        end
        RubyWalker.world.nil
      end
    end
  end
end
