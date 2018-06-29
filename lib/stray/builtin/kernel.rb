require_relative 'basic_object'

module Stray
  module Builtin
    module Kernel
      def puts(*args)
        args.each do |e|
          Stray.world.stdout.write(e.rb_to_s)
          Stray.world.stdout.write("\n")
        end
        Stray.world.nil
      end
    end
  end
end
