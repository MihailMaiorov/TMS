MIN = 1
MAX = 38
CONFIG = {
  'red' => { 'coefficient' => 2, 'numbers' => (1..18) },
  'black' => { 'coefficient' => 2, 'numbers' => (19..36) },
  'green' => { 'coefficient' => 36, 'numbers' => (37..38) }
}.freeze

ALL_COLORS = %w[red black green].freeze
CONTINUATION_GAME = %w[y n].freeze

def color_drop
  random_number_color = rand(MIN..MAX)

  CONFIG.select { |key, value| return key if value['numbers'].include?(random_number_color) }
end

def user_input(welcome_msg: nil, validator: nil, error_msg: nil)
  loop do
    puts welcome_msg unless welcome_msg.nil?

    value = gets.strip

    return value if validator.nil? || validator.call(value)

    puts error_msg unless error_msg.nil?
  end
end

def continuation_game
  user_input(welcome_msg: 'Желаете сделать ставку? (y/n)',
             validator: ->(value) { CONTINUATION_GAME.include?(value) },
             error_msg: 'Некорректный ответ.')
end

def player_name
  user_input(welcome_msg: 'Ваше имя:',
             validator: ->(value) { !value.empty? },
             error_msg: 'Имя не может быть пустым!')
end

def player_choose_color
  user_input(welcome_msg: 'Выберите цвет: (red, black, green)',
             validator: ->(value) { ALL_COLORS.include?(value) },
             error_msg: 'Некорректный цвет.')
end

def player_bet(money)
  user_input(welcome_msg: "Сделайте ставку. (стек равен #{money})",
             validator: ->(value) { value.to_i <= money && value.to_i.positive? },
             error_msg: 'Некорректная ставка.')
end

def game_result(player_color, color, bet_value, bet)
  if player_color == color
    puts "Вы выиграли #{bet_value}!!!"
    bet_value - bet
  else
    puts "Вы проиграли #{bet}"
    -bet
  end
end

def game_runer
  puts 'Добро пожаловать в Американскую рулетку!'
  name = player_name
  money = 100.00

  while money.positive?
    puts "#{name} Ваш стек равен #{money}"
    break unless continuation_game == 'y'

    player_color = player_choose_color
    puts "Вы выбрали: #{player_color}"

    bet = player_bet(money).to_i

    puts "Ваша ставка: #{bet}"

    color = color_drop

    bet_value = bet * CONFIG[color]['coefficient']

    puts "Ставки сделаны, ставок больше нет!\nВыпал: #{color}"

    money += game_result(player_color, color, bet_value, bet)
  end
end

game_runer
