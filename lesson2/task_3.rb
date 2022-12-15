loop do
  puts 'Enter base of a triangle.'
  base = gets.to_f
  puts 'Enter triangle height.'
  height = gets.to_f
  area = base * height * 0.5
  puts "Area of a triangle is #{area}."
end
