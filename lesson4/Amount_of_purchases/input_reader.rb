class InputReader
  def read(welcome_msg: nil, validator: nil, error_msg: nil)
    loop do
      puts welcome_msg unless welcome_msg.nil?

      value = gets.strip

      return value if validator.nil? || validator.call(value)

      puts error_msg unless error_msg.nil?
    end
  end
end
