# +1. компьютер загадывает число
# 2. просим пользователя угадать число (рассказать пользователю про правила игры)
# 3. проверяем угадал ли и чуть что подсказываем
# 4. обновляем количество попыток

MIN = 0
MAX = 100_000_000_000_000_000_000_000_000
MAX_TRIES = 7
INPUT_EQUEL = 'Вы выиграли!'.freeze
INPUT_LOWER = 'Ваше число меньше загаданного!'.freeze
INPUT_HIGER = 'Ваше число больше загаданного!'.freeze

def right_guess?(users_guess, secret_number)
  if users_guess == secret_number
    INPUT_EQUEL
  elsif users_guess < secret_number
    INPUT_LOWER
  elsif users_guess > secret_number
    INPUT_HIGER
  end
end

secret_number = rand(MIN..MAX)
current_guess = (MIN + MAX) / 2
lower_bound = MIN
upper_bound = MAX

loop do
  guess_result = right_guess?(current_guess, secret_number)

  case guess_result
  when INPUT_EQUEL
    puts "Победа! #{secret_number}"
    break
  when INPUT_LOWER
    lower_bound = current_guess
    current_guess += ((upper_bound - current_guess) / 2.0).round
  when INPUT_HIGER
    upper_bound = current_guess
    current_guess -= ((current_guess - lower_bound) / 2.0).round
  end
end
