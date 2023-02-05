# 1. Создать метод который принимает на вход три параметра: login, password и confirm_password.
# 2. Login должен содержать только латинские буквы, цифры и знак подчеркивания.
# 3. Длина login должна быть меньше 20 символов. Если login не соответствует этим требованиям,
#    необходимо выбросить WrongLoginException.
# 4. Password должен содержать только латинские буквы, цифры и знак подчеркивания.
#    Длина password должна быть меньше 20 символов.
#    Также password и confirm _password должны быть равны.
#    Если password не соответствует этим требованиям, необходимо выбросить WrongPasswordException.
# 5. WrongPasswordException и WrongLoginException - пользовательские классы исключения
#    с двумя конструкторами – один по умолчанию, второй принимает сообщение исключения
#    и передает его в конструктор класса Exception.
# 6. Обработка исключений проводится внутри метода.
# 7. Метод возвращает true, если значения верны или false в другом случае.

module RegistrationVerifier
  def login_checker(welcome_msg:, validator:)
    print welcome_msg
    value = gets.strip
    raise self.class::WrongLoginException unless validator.call(value)

    value
  end

  def password_checker(welcome_msg:, validator:)
    print welcome_msg
    value = gets.strip
    raise self.class::WrongPasswordException unless validator.call(value)

    value
  end
end

class MyValididator
  include RegistrationVerifier

  LOGIN_VALIDATE = /\A\w{1,19}\z/.freeze
  PASSWORD_VALIDATE = /\A\w{1,19}\z/.freeze
  LOGIN_MAX_SIZE = 19
  PASSWORD_MAX_SIZE = 19
  MAX_RETRY = 3

  attr_reader :login

  def initialize
    @login = check_login
    @password = check_password
    @confirmed_password = confirm_password
  end

  private

  attr_reader :password, :confirmed_password

  def check_login
    retry_count = 0

    begin
      login_checker(
        welcome_msg: 'Enter your login: ',
        validator: ->(value) { value.match?(LOGIN_VALIDATE) }
      )
    rescue WrongLoginException => e
      puts "#{e.message}: only latin letters, numbers and underscores, max size #{LOGIN_MAX_SIZE}"
      retry_count += 1
      retry if retry_count < MAX_RETRY
      exit
    end
  end

  def check_password
    retry_count = 0

    begin
      password_checker(
        welcome_msg: 'Enter your password: ',
        validator: ->(value) { value.match?(PASSWORD_VALIDATE) }
      )
    rescue WrongPasswordException => e
      puts "#{e.message}: only latin letters, numbers and underscores, max size #{PASSWORD_MAX_SIZE}"
      retry_count += 1
      retry if retry_count < MAX_RETRY
      exit
    end
  end

  def confirm_password
    retry_count = 0

    begin
      password_checker(
        welcome_msg: 'Confirm your password: ',
        validator: ->(value) { value == password }
      )
    rescue WrongPasswordException => e
      puts "#{e.message}: password and confirm password must be equal"
      retry_count += 1
      retry if retry_count < MAX_RETRY
      exit
    end
  end

  class WrongLoginException < StandardError
    def initialize(message = 'Incorrect login')
      super(message)
    end
  end

  class WrongPasswordException < StandardError
    def initialize(message = 'Incorrect password')
      super(message)
    end
  end
end

MyValididator.new
