# NODE_CALL
puts 1.to_s
# NODE_CALL 引数つき
puts 1.to_s(2)

def foo
  puts "foo is called"
  2
end

a = nil
puts a&.to_s(foo)
puts a&.to_s

a = 10
puts a&.to_s(foo)
puts a&.to_s
