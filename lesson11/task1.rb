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
    LoginChecker.check(welcome_msg: 'Enter your login: ',
                       validator: ->(value) { value.match?(LOGIN_VALIDATE) })
  end

  def check_password
    PasswordChecker.check(welcome_msg: 'Enter your password: ',
                          validator: ->(value) { value.match?(PASSWORD_VALIDATE) })
  end

  def confirm_password
    PasswordChecker.confirm(welcome_msg: 'Confirm your password: ',
                            validator: ->(value) { value == password })
  end

  class WrongLoginException < StandardError
    def self.valid_error
      "only latin letters, numbers and underscores, max size #{MyValididator::LOGIN_MAX_SIZE}"
    end
  end

  class WrongPasswordException < StandardError
    class << self
      def valid_error
        "only latin letters, numbers and underscores, max size #{MyValididator::RASSWORD_MAX_SIZE}"
      end

      def confirm_error
        'password and confirm password must be equal'
      end
    end
  end
end

class LoginChecker
  def self.check(welcome_msg:, validator:)
    print welcome_msg
    value = gets.strip
    raise MyValididator::WrongLoginException.valid_error unless validator.call(value)

    value
  end
end

class PasswordChecker
  class << self
    def check(welcome_msg:, validator:)
      print welcome_msg
      value = gets.strip
      raise MyValididator::WrongPasswordException.valid_error unless validator.call(value)

      value
    end

    def confirm(welcome_msg:, validator:)
      print welcome_msg
      value = gets.strip
      raise MyValididator::WrongPasswordException.confirm_error unless validator.call(value)

      value
    end
  end
end

MyValididator.new
