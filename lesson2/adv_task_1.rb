# Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с.
# Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть)
# и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
# Если D > 0, то выводим дискриминант и 2 корня
# Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
# Если D < 0, то выводим дискриминант и сообщение "Корней нет"
# Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru).
# Для вычисления квадратного корня, нужно использовать
# Квадратное уравнение — это уравнение вида ax2 + bx + c = 0,
# где a — первый или старший коэффициент, не равный нулю, b — второй коэффициент,
# c — свободный член

a = nil

loop do
  puts 'Введите число а'
  a = gets.to_f
  break unless a.zero?

  puts 'a не может быть нулем'
end

puts 'Введите число b'
b = gets.to_f

puts 'Введите число c'
c = gets.to_f

d = (b**2 - 4 * a * c).round(2)
puts "Дискриминант = #{d}"
if d.positive?
  root_d_first = ((-b + Math.sqrt(d)) / (2 * a)).round(2)
  root_d_second = ((-b - Math.sqrt(d)) / (2 * a)).round(2)
  puts "Дискриминант имеет два корня: #{root_d_first} и #{root_d_second}"
elsif d.zero?
  root = (-b / (2 * a)).round(2)
  puts "Дискриминант имеет один корень: #{root}"
else
  puts 'Дискриминант не имеет корней'
end
