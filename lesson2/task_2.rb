# # Идеальный вес. Программа запрашивает у пользователя имя и рост
#  и выводит идеальный вес по формуле (<рост> - 110) * 1.15,
#  после чего выводит результат пользователю на экран с обращением по имени.
#  Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

loop do
  puts 'Enter your name.'
  name = gets.strip
  puts 'Enter your growth.'
  growth = gets.to_f
  ideal_weight = (growth - 110) * 1.15

  if ideal_weight.positive?
    puts "#{name} your ideal weight is #{ideal_weight}."
  else
    puts 'Your weight is optimal.'
  end
end
