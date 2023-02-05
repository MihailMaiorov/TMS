# Написать программу, которая проверяет что подаётся на ввод.
# Если подаётся что-то вместо числа - вызывать исключение и в обработке вывести, что было подано.

class NumberChecker
  NUMBER_VALIDATE = /\A\d+\.?\d*\z/.freeze

  def self.check
    print 'Enter a number: '
    number = gets.strip

    raise NumberError, "'#{number}' is not a number" unless number.match?(NUMBER_VALIDATE)

    puts "#{number} is the number!"
  end

  class NumberError < StandardError; end
end

NumberChecker.check
