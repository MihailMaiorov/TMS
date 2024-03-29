# Реализуйте иерархию классов Figure, Circle, Square, Rectangle, Triangle
# с методами area() и perimeter(), которые возвращают площадь и периметр фигуры.
# Используйте полиморфизм.

class Figure
  attr_reader :side_a, :side_b, :side_c

  def initialize(side_a = nil, side_b = nil, side_c = nil)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end
end

class Circle < Figure
  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * radius**2
  end

  def perimeter
    Math::PI * radius * 2
  end
end

class Rectangle < Figure
  def area
    side_a * side_b
  end

  def perimeter
    (side_a + side_b) * 2
  end
end

class Square < Rectangle
  def initialize(side_a)
    super
    @side_b = side_a
  end
end

class Triangle < Figure
  def area
    semi_per = (side_a + side_b + side_c) / 2.0

    Math.sqrt(semi_per * (semi_per - side_a) * (semi_per - side_b) * (semi_per - side_c))
  end

  def perimeter
    side_a + side_b + side_c
  end
end
