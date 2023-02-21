require_relative 'processing_csv'

class Employee
  include ProcessingCSV

  def calculate_salary
    processed_data.each { |employee| employee[:salary] = employee[:rate] * employee[:hours_worked] }
  end

  def create
    csv_write(new_data)
  end

  def fire(last_name)
    csv_delete(last_name)

    puts 'Employee fired'
  end

  def update(employee, header)
    param = header.to_s.gsub(/_/, ' ')
    print "Enter new #{param}: "
    new_value = gets.strip

    csv_update(header, employee[:last_name], new_value)

    puts "#{param} successfully edit."
  end

  private

  def new_data
    print 'Enter first name: '
    first_name = gets.strip.capitalize
    print 'Enter second name: '
    second_name = gets.strip.capitalize
    print 'Enter job position: '
    job_position = gets.strip.downcase
    print 'Enter rate: '
    rate = gets.to_f
    print 'Enter hours worked: '
    hours_worked = gets.to_i
    print 'Enter experience: '
    experience = gets.to_i
    [first_name, second_name, job_position, rate, hours_worked, experience]
  end
end
