# +1. компьютер загадывает число
# 2. компьютер отгадывает число

MIN = 0
MAX = 100_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
MAX_TRIES = 7

secret_number = rand(MIN..MAX)
lower_bound = MIN
upper_bound = MAX
computer_guess = (lower_bound + upper_bound) / 2

loop do
  if computer_guess < secret_number
    lower_bound = computer_guess
    computer_guess += ((upper_bound - lower_bound) / 2.0).round
  elsif computer_guess > secret_number
    upper_bound = computer_guess
    computer_guess -= ((upper_bound - lower_bound) / 2.0).round
  else
    puts "Победа! #{secret_number}"
    break
  end
end
