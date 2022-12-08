puts 'Enter spruce height(min 3)'
loop do
  user_input = gets.chomp.to_i
  user_input_copy = user_input
  space = ' '
  lattice = '#'
  if user_input < 3
    puts 'Minimum 3 levels'
  else user_input.times do
    puts "#{space * (user_input - 2)}#{lattice}"
    user_input -= 1
    lattice += '##'
      if user_input == 1
        puts "#{space * (user_input_copy - 2)}#"
        return
      end
    end
    break
  end
end



