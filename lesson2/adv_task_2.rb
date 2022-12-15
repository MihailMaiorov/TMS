puts "Добро пожаловать в Американскую рулетку! \nВведите свое имя:"
name = gets.strip
money = 100.00
contin_game = %w[y n]
all_color = %w[red black green]

until money.zero?
  puts "#{name} Ваш стек равен #{money}"
  puts 'Желаете сделать ставку? (y/n)'
  game = gets.strip[0]

  until contin_game.include?(game)
    puts 'Некорректный ответ. Введите (y/n)'
    game = gets.strip[0]
  end

  if game == 'y'

    rand_color = rand(1..38)

    if rand_color.between?(1, 18)
      color = 'black'
    elsif rand_color.between?(19, 36)
      color = 'red'
    else
      color = 'green'
    end

    puts 'Выберите цвет: (black, red, green)'
    user_color = gets.strip

    until all_color.include?(user_color)
      puts 'Некорректный цвет. (black, red, green)'
      user_color = gets.strip
    end

    puts 'Сделайте ставку'
    bet = gets.to_f

    while bet > money
      puts "Недостаточно средств (стек равен #{money})"
      bet = gets.to_f
    end

    money -= bet
    puts "Ставки сделаны, ставок больше нет!\nВыпал: #{color}"
    color == 'green' ? value = bet * 36 : value = bet * 2

    if user_color == color
      puts "Вы выиграли #{value}!!!"
      money += value
    else
      puts 'Вы проиграли.'
    end

  else
    puts "Спасибо за игру. Ваш стек равен #{money}"
    break
  end
end
