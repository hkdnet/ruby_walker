module RubyWalker
  class World
    # 即値
    TRUE = ::RubyWalker::Builtin::True.new(true)
    FALSE = ::RubyWalker::Builtin::False.new(false)
    NIL = ::RubyWalker::Builtin::Nil.new(nil)

    attr_reader :stdin
    attr_reader :stdout

    def initialize
      @stdin = STDIN
      @stdout = STDOUT
    end

    def true
      TRUE
    end

    def false
      FALSE
    end

    def nil
      NIL
    end
  end
end
