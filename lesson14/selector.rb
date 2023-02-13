require 'csv'
require_relative 'parser'

class Selector
  include Parser

  def select_by_last_name
    print 'Select an employee by last name: '
    last_name = gets.strip.downcase

    selector do |row|
      row[:last_name].downcase == last_name
    end
  end

  def selector(&block)
    puts processed_data.select(&block)
  end
end
