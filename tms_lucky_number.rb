loop do
  puts 'Enter your six-digit numder'
  user_number = gets.to_i
  if user_number.negative?
    puts 'Number must be integer'
  elsif user_number.digits.length != 6
    puts 'Number must be six-digit'
  else
    first_half = user_number.digits[3..5].sum
    second_half = user_number.digits[0..2].sum
    if first_half == second_half
      puts "#{user_number} LUCKY!!!"
    else
      puts "#{user_number} Unlucky"
    end
  break
  end
end
