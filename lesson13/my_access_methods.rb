module MyAccessMethods
  def my_attr_reader(*args)
    args.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
      end
    end
  end

  def my_attr_writer(*args)
    args.each do |name|
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end

  def my_attr_accessor(*args)
    my_attr_reader(*args)
    my_attr_writer(*args)
  end
end

class TestMyAccessMethods
  extend MyAccessMethods

  my_attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
