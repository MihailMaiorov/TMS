loop do
  sides = []
  puts 'Введите сторону треугольника: "a"'
  sides << gets.to_f
  puts 'Введите сторону треугольника: "b"'
  sides << gets.to_f
  puts 'Введите сторону треугольника: "c"'
  sides << gets.to_f
  sides.sort!

  # if sides[-1]**2 == sides[0]**2 + sides[1]**2
  #   puts 'Это прямоугольный треугольник'
  # elsif sides[0] == sides[1] && sides[1] == sides[-1]
  #   puts 'Это равносторонний и равнобедренный треугольник'
  # elsif sides[0] == sides[1] && sides[1] != sides[-1] || sides[0] != sides[1] && sides[1] == sides[-1]
  #   puts 'Это равнобедренный треугольник'
  # else
  #   puts 'Это разносторонний треугольник'
  # end

  if sides[-1]**2 == sides[0]**2 + sides[1]**2
    puts 'Это прямоугольный треугольник.'
  elsif sides.uniq.length == 1
    puts 'Это равносторонний и равнобедренный треугольник.'
  elsif sides.uniq.length == 2
    puts 'Это равнобедренный треугольник.'
  else
    puts 'Это разносторонний треугольник.'
  end
end
