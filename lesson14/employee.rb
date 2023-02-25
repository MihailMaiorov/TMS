require_relative 'processing_csv'
require_relative 'input_reader'

class Employee
  include ProcessingCSV

  FIRST_NAME_VALIDATE = /\A[A-Z][a-z]{1,20}\z/
  SECOND_NAME_VALIDATE = /\A[A-Z][a-z]{,20}'?-?[A-Za-z]{,20}\z/
  JOB_VALIDATE = /\A[a-z]{2,20}\z/
  RATE_VALIDATE = /\A\d+\.?\d{,2}\z/
  HOURSE_VALIDATE = /\A\d+\z/
  EXPERIENCE_VALIDATE = /\A\d+\z/

  def initialize
    @input_reader = InputReader.new
  end

  def calculate_salary
    processed_data.each { |employee| employee[:salary] = employee[:rate] * employee[:hours_worked] }
  end

  def create
    csv_write(new_data)

    puts 'New employee successfully added'
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
    first_name = input_first_name
    second_name = input_second_name
    job_position = input_job_position
    rate = input_rate
    hours_worked = input_hours_worked
    experience = input_experience

    [first_name, second_name, job_position, rate, hours_worked, experience]
  end

  def input_first_name
    InputReader.read(
      welcome_msg: 'Enter first name:',
      validator: ->(value) { FIRST_NAME_VALIDATE.match?(value) },
      error_msg: 'Invalid first name'
    )
  end

  def input_second_name
    InputReader.read(
      welcome_msg: 'Enter second name:',
      validator: ->(value) { SECOND_NAME_VALIDATE.match?(value) },
      error_msg: 'Invalid second name'
    )
  end

  def input_job_position
    InputReader.read(
      welcome_msg: 'Enter job position:',
      validator: ->(value) { JOB_VALIDATE.match?(value) },
      error_msg: 'Invalid job position'
    )
  end

  def input_rate
    InputReader.read(
      welcome_msg: 'Enter rate:',
      validator: ->(value) { RATE_VALIDATE.match?(value) },
      error_msg: 'Invalid rate'
    )
  end

  def input_hours_worked
    InputReader.read(
      welcome_msg: 'Enter hours worked:',
      validator: ->(value) { HOURSE_VALIDATE.match?(value) },
      error_msg: 'Invalid hours worked'
    )
  end

  def input_experience
    InputReader.read(
      welcome_msg: 'Enter experience:',
      validator: ->(value) { EXPERIENCE_VALIDATE.match?(value) },
      error_msg: 'Invalid experience'
    )
  end
end
