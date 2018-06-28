class Parent
  class << self
    def method_added(name)
      puts "method_added #{name}: cm"
    end

    def singleton_method_added(name)
      puts "singleton_method_added #{name}: cm"
    end
  end
  def method_added(name)
    puts "method_added #{name}: im"
  end

  def singleton_method_added(name)
    puts "singleton_method_added #{name}: im"
  end
end

class Child < Parent
  def foo
  end
end
