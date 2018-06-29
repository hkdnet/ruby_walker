def foo
  puts :foo
end

foo

def bar(arg)
  puts arg
end

bar :bar

def blk
  yield 1
end

blk do |arg|
  puts arg
end
