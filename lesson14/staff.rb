require_relative 'processing_csv'

class Staff
  include ProcessingCSV

  attr_accessor :employee

  def initialize
    @employee = nil
  end

  def select_by_last_name
    print "Enter the employee's last name: "
    last_name = gets.strip.downcase
    last_names = processed_data.map { |row| row[:last_name].downcase }

    raise WrongLastNameError, 'Incorrect last name select' unless last_names.include?(last_name)

    selector(last_name)
  rescue WrongLastNameError => e
    puts e.message
    retry
  end

  def sort_by_params(param)
    processed_data.sort_by { |employee| employee[param] }
  end

  def info
    csv_read
  end

  private

  def selector(last_name)
    @employee = processed_data.select { |row| row[:last_name].downcase == last_name }.first
  end

  class WrongLastNameError < StandardError; end
end
