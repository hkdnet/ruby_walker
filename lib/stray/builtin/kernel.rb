require_relative 'basic_object'

module Stray
  module Builtin
    module Kernel
      def puts(*args)
        args.each do |e|
          case e
          when ::Stray::Builtin::Array
            e.each { |elm| puts elm }
          else
            Stray.world.stdout.write(e.rb_to_s)
            Stray.world.stdout.write("\n")
          end
        end
        Stray.world.nil
      end

      def exit(status = true)
        Kernel.__send__(:exit, status)
      end
    end
  end
end
