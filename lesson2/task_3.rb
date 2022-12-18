# Площадь треугольника. Площадь треугольника можно вычислить,
# зная его основание (a) и высоту (h) по формуле: 1/2*a*h.
# Программа должна запрашивать основание и высоту треугольника и возвращать его площадь.

loop do
  puts 'Enter base of a triangle.'
  base = gets.to_f
  puts 'Enter triangle height.'
  height = gets.to_f
  area = base * height / 2
  puts "Area of a triangle is #{area}."
end
