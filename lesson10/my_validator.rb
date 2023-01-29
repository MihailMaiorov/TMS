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

class MyValididator
  LOGIN_MAX_SIZE = 19
  LOGIN_VALIDATE = /\A\w{1,19}\z/.freeze
  RASSWORD_MAX_SIZE = 19
  PASSWORD_VALIDATE = /\A\w{1,19}\z/.freeze

  attr_reader :login

  def initialize
    @login = check_login
    @password = check_password
    @confirmed_password = confirm_password
  end

  private

  attr_reader :password, :confirmed_password

  def check_login
    print 'Enter your login: '
    login = gets.strip
    raise WrongLoginException.valid_message unless login.match?(LOGIN_VALIDATE)

    login
  end

  def check_password
    print 'Enter your password: '
    password = gets.strip
    raise WrongPasswordException.valid_message unless password.match?(PASSWORD_VALIDATE)

    password
  end

  def confirm_password
    print 'Confirm your password: '
    confirm_password = gets.strip
    raise WrongPasswordException.confirm_error unless password == confirm_password

    confirm_password
  end

  class WrongLoginException < StandardError
    def self.valid_message
      "only latin letters, numbers and underscores, max size #{MyValididator::LOGIN_MAX_SIZE}"
    end
  end

  class WrongPasswordException < StandardError
    class << self
      def valid_message
        "only latin letters, numbers and underscores, max size #{MyValididator::RASSWORD_MAX_SIZE}"
      end

      def confirm_error
        'password and confirm password must be equal'
      end
    end
  end
end

MyValididator.new
