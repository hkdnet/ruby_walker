module Stray
  Method = Struct.new(:name, :args, :arity, :body, keyword_init: true) do
    def arg_hash(arg_values)
      # TODO arity チェック
      # TODO option 引数とか
      args.zip(arg_values).to_h
    end
  end
end
