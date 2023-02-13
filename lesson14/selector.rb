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

    @employee = selector { |row| row[:last_name].downcase == last_name }.first
  end

  def selector(&block)
    processed_data.select(&block)
  end
end
