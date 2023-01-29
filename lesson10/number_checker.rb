# Написать программу, которая проверяет что подаётся на ввод.
# Если подаётся что-то вместо числа - вызывать исключение и в обработке вывести, что было подано.

class NumberChecker
  MAX_RETRY = 5

  def self.check
    retry_count = 0

    begin
      print 'Enter a number: '
      number = Integer(gets.strip)
      puts "#{number} is the number!"
    rescue ArgumentError => e
      puts e.message
      retry_count += 1
      retry if retry_count < MAX_RETRY
      puts 'Gotta learn the numbers!!!'
    end
  end
end

NumberChecker.check

