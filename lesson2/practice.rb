loop do
  color = %w[black red green].shuffle
  puts 'Enter you color (black, green, red)'

  user_color = gets.strip

  if user_color == color[0]
    puts 'You win!!!'
  else
    puts 'You lose!!!'
    puts "Color is #{color[0]}"
  end
end

