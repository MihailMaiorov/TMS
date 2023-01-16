class Mammal
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def introduce
    puts "#{name} is #{age} years old #{self.class::CLASS}"
  end

  def breed
    puts "#{name} breed #{self.class::BREED}"
  rescue NameError => e
    puts "Error: #{self.class} dont have representative of the breed(#{e.message})"
  end

  def birthday
    @age += 1
  end
end

class Cat < Mammal
  CLASS = 'Cat'

  def speak
    puts 'MEOW'
  end

  def eat
    puts "#{name} eats milk and fish."
  end
end

class Dog < Mammal
  CLASS = 'Dog'

  def speak
    puts 'WOOF'
  end

  def eat
    puts "#{name} eats meat and dog food."
  end
end

class Horse < Mammal
  CLASS = 'Horse'

  def speak
    puts 'EEEE'
  end

  def eat
    puts "#{name} eats grass."
  end
end

class Elephant < Mammal
  CLASS = 'Elephant'

  def speak
    puts 'UUUU'
  end

  def eat
    puts "#{name} eats grass and leaves."
  end
end

class GermanShepherd < Dog
  BREED = 'German Shepherd'

  def speak
    puts 'Bark! Bark!'
  end

  def breed_info
    puts "#{name} breed of working dog of medium to large size."
  end
end

class LabradorRetriever < Dog
  BREED = 'Labrador Retriever'

  def speak
    puts 'WOOOOOF'
  end

  def breed_info
    puts "#{name} breed of retriever gun dog."
  end
end

class Clydesdale < Horse
  BREED = 'Clydesdale'

  def eat
    puts "#{name} eats grass."
  end

  def breed_info
    puts "#{name} breed of of draught horse."
  end
end

class Palomino < Horse
  BREED = 'Palomino'

  def eat
    puts "#{name} eats corn and hay."
  end

  def breed_info
    puts "#{name} is a genetic color in horses."
  end
end
