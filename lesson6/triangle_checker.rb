# Николаю требуется проверить, возможно ли из представленных отрезков условной длины сформировать треугольник.
# Для этого он решил создать класс TriangleChecker, принимающий только положительные числа.
# С помощью метода is triangle() возвращаются следующие значения (в зависимости от ситуации):
# – Ура, можно построить треугольник!;
# – С отрицательными числами ничего не выйдет!;
# – Нужно вводить только числа!;
# – Жаль, но из этого треугольник не сделать.

class TriangleChecker
  attr_reader :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def triangle?
    return 'You only need to enter numbers!' unless [side_a, side_b, side_c].all?(Numeric)

    if side_a.negative? || side_b.negative? || side_c.negative?
      'Nothing will work with negative numbers!'
    elsif side_a + side_b > side_c && side_b + side_c > side_a && side_a + side_c > side_b
      'Hooray, you can build a triangle!'
    else
      "It's a pity, but you can't make a triangle out of this."
    end
  end
end
