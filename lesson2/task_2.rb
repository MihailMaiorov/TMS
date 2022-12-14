loop do
  puts 'Enter your name'
  name = gets.strip
  puts 'Enter your growth'
  growth = gets.to_f
  ideal_weight = (growth - 110) * 1.15
  puts "#{name} your ideal weight is #{ideal_weight}"
  puts 'Your weight is optimal' if ideal_weight.negative?
end
