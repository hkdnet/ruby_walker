module RubyWalker
  class Integer
    attr_reader :val

    def initialize(val)
      @val = val
    end

    def +(other)
      RubyWalker::Integer.new(val + other.val)
    end

    def to_s
      val.to_s
    end
  end
end
