module Stray
  class World
    # 即値
    TRUE = ::Stray::Builtin::True.new(true)
    FALSE = ::Stray::Builtin::False.new(false)
    NIL = ::Stray::Builtin::Nil.new(nil)

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

    def constants
      @constants ||= {}
    end
  end
end
