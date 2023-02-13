require 'csv'
require_relative 'processing_csv'

class Employee
  include ProcessingCSV

  def salary
    processed_data.map { |employee| employee[:rate] * employee[:hours_worked] }
  end

  def add
    writer(user_input)

    puts 'New employee successfully added'
  end

  private

  def user_input
    print 'Enter name: '
    name = gets.strip
    print 'Enter surname: '
    surname = gets.strip
    print 'Enter job position: '
    job_position = gets.strip
    print 'Enter rate: '
    rate = gets.to_i
    print 'Enter hours worked: '
    hours_worked = gets.to_i
    print 'Enter experience: '
    experience = gets.to_i
    [name, surname, job_position, rate, hours_worked, experience]
  end
end
