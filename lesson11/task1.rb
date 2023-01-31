class MyValididator
  LOGIN_MAX_SIZE = 19
  LOGIN_VALIDATE = /\A\w{1,19}\z/.freeze
  PASSWORD_MAX_SIZE = 19
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
    LoginChecker.new.check(welcome_msg: 'Enter your login: ',
                           validator: ->(value) { value.match?(LOGIN_VALIDATE) })
  end

  def check_password
    PasswordChecker.new.check(welcome_msg: 'Enter your password: ',
                              validator: ->(value) { value.match?(PASSWORD_VALIDATE) })
  end

  def confirm_password
    PasswordChecker.new.confirm(welcome_msg: 'Confirm your password: ',
                                validator: ->(value) { value == password })
  end
end

class LoginChecker
  def check(welcome_msg:, validator:)
    print welcome_msg
    value = gets.strip
    raise self.class::WrongLoginException.valid_error unless validator.call(value)

    value
  end

  class WrongLoginException < StandardError
    def self.valid_error
      msg = "only latin letters, numbers and underscores, max size #{MyValididator::LOGIN_MAX_SIZE}"
      new(msg)
    end
  end
end

class PasswordChecker
  def check(welcome_msg:, validator:)
    print welcome_msg
    value = gets.strip
    raise self.class::WrongPasswordException.valid_error unless validator.call(value)

    value
  end

  def confirm(welcome_msg:, validator:)
    print welcome_msg
    value = gets.strip
    raise self.class::WrongPasswordException.confirm_error unless validator.call(value)

    value
  end

  class WrongPasswordException < StandardError
    class << self
      def valid_error
        msg = "only latin letters, numbers and underscores, max size #{MyValididator::PASSWORD_MAX_SIZE}"
        new(msg)
      end

      def confirm_error
        msg = 'password and confirm password must be equal'
        new(msg)
      end
    end
  end
end

MyValididator.new
