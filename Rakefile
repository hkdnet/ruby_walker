task :test do
  expected = `ruby foo.rb`
  actual = `ruby main.rb foo.rb`
  if expected == actual
    puts "ok"
  else
    STDERR.puts expected
    STDERR.puts '---'
    STDERR.puts actual
    abort "ng"
  end
end
