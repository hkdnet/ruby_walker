module RubyWalker
  Method = Struct.new(:name, :args, :body, keyword_init: true)
end
