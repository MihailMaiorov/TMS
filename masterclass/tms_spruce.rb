puts 'Enter spruce height'
user_input = gets.chomp.to_i
user_input_copy = user_input
space = ' '
lattice = '#'


user_input.times do
  puts "#{space * (user_input - 2)}#{lattice}"
  user_input -= 1
  lattice += '##'
  if user_input == 1
    puts "#{space * (user_input_copy - 2)}#"
    break
  end
end