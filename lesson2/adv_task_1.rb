puts 'Введите число а'
a = gets.to_f
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
