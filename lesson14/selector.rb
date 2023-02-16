require 'csv'
require_relative 'processing_csv'

class Selector
  include ProcessingCSV

  attr_accessor :employee

  def initialize
    @employee = nil
  end

  def select_by_last_name
    print 'Select an employee by last name: '
    last_name = gets.strip.downcase
    last_names = processed_data.map { |row| row[:last_name].downcase }

    raise WrongLastNameError unless last_names.include?(last_name)

    @employee = selector { |row| row[:last_name].downcase == last_name }.first
  rescue WrongLastNameError => e
    puts e.message
    retry
  end

  def selector(&block)
    processed_data.select(&block)
  end

  class WrongLastNameError < StandardError
    def initialize(message = 'Incorrect last name select')
      super(message)
    end
  end
end
