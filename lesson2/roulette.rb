loop do
  color = rand(1..100)
  puts 'Enter you color (black, red, zero)'
  user_color = gets.strip

  if color.between?(1, 49)
    guessed_color = 'black'
  elsif color.between?(49, 98)
    guessed_color = 'red'
  else
    guessed_color = 'zero'
  end

  if user_color == guessed_color
    puts 'You win!!!'
  else
    puts 'You lose!!!'
    puts "Guessed color is #{guessed_color}"
  end
end
