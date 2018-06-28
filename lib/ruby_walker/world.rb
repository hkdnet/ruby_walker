module RubyWalker
  class World
    attr_reader :stdin
    attr_reader :stdout

    def initialize
      @stdin = STDIN
      @stdout = STDOUT
    end
  end
end
