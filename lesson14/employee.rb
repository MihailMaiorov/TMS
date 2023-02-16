require 'csv'
require_relative 'processing_csv'

class Employee
  include ProcessingCSV

  def calculate_salary
    processed_data.each { |employee| employee[:salary] = employee[:rate] * employee[:hours_worked] }
  end

  def add
    csv_write(user_input)

    puts 'New employee successfully added'
  end

  private

  def user_input
    print 'Enter name: '
    name = gets.strip.capitalize
    print 'Enter surname: '
    surname = gets.strip.capitalize
    print 'Enter job position: '
    job_position = gets.strip.downcase
    print 'Enter rate: '
    rate = gets.to_i
    print 'Enter hours worked: '
    hours_worked = gets.to_i
    print 'Enter experience: '
    experience = gets.to_i
    [name, surname, job_position, rate, hours_worked, experience]
  end
end
