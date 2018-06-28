module RubyWalker
  class Kernel
    attr_reader :stdout
    attr_reader :stderr

    def initialize
      @stdout = StringIO.new
      @stderr = StringIO.new
    end

    def puts(*args)
      args.each do |arg|
        @stdout.write(arg.to_s)
        @stdout.write("\n")
      end
    end
  end
end
