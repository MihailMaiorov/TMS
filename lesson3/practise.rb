# +1. компьютер загадывает число
# 2. просим пользователя угадать число (рассказать пользователю про правила игры)
# 3. проверяем угадал ли и чуть что подсказываем
# 4. обновляем количество попыток

MIN = 0
MAX = 100000000000000000000000000000000000000000000000000000000000000000000000000000000000
MAX_TRIES = 7
INPUT_EQUEL = 'Вы выиграли!'
INPUT_LOWER = 'Ваше число меньше загаданного!'
INPUT_HIGER = 'Ваше число больше загаданного!'

def right_guess?(users_guess, secret_number, _lower_bound, _upper_bound)
  if users_guess == secret_number
    return INPUT_EQUEL
  elsif users_guess < secret_number
    return INPUT_LOWER
  elsif users_guess > secret_number
    return INPUT_HIGER
  end
end

secret_number = rand(MIN..MAX)
current_guess = (MIN + MAX) / 2
lower_bound = MIN
upper_bound = MAX

loop do
  guess_result = right_guess?(current_guess, secret_number, lower_bound, upper_bound)

  if guess_result == INPUT_EQUEL
    puts "Победа! #{secret_number}"
    break
  elsif guess_result == INPUT_LOWER
    lower_bound = current_guess
    current_guess += ((upper_bound - current_guess) / 2.0).round
  elsif guess_result == INPUT_HIGER
    upper_bound = current_guess
    current_guess -= ((current_guess - lower_bound) / 2.0).round
  end
end
