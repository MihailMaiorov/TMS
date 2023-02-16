require 'csv'
require_relative 'processing_csv'
require_relative 'sorter'
require_relative 'selector'
require_relative 'employee'
require_relative 'editor'

class Engine
  include ProcessingCSV

  def initialize
    @sorter = Sorter.new
    @selector = Selector.new
    @employee = Employee.new
    @editor = Editor.new
  end

  def intro_level
    puts '1. Show all employees, 2. Sort employees, 3. Add employee, 4. Calculate salary, 5. Quit'
    puts 'Enter a number(1, 2, 3, 4, 5)'

    user_input = gets.to_i

    case user_input
    when 1
      Engine.new.reader
    when 2
      sort_level
    when 3
      @employee.add
    when 4
      puts @employee.calculate_salary
    when 5
      exit
    else
      raise WrongOptionSelect
    end
  rescue WrongOptionSelect => e
    puts e.message
    retry
  end

  def sort_level
    puts 'How to sort?(1. first name, 2. last name, 3. job position, 4. rate, 5. hours worked, 6. experience, 7. Back)'

    user_input = gets.to_i
    sort_param =
      case user_input
      when 1
        :first_name
      when 2
        :last_name
      when 3
        :job_position
      when 4
        :rate
      when 5
        :hours_worked
      when 6
        :experience
      when 7
        return intro_level
      else
        raise WrongOptionSelect
      end

    puts @sorter.sorter(sort_param)
    select_level
  rescue WrongOptionSelect => e
    puts e.message
    retry
  end

  def select_level
    puts '1. select employeer, 2. Back'

    user_input = gets.to_i

    case user_input
    when 1
      @selector.select_by_last_name
      puts @selector.employee
      profile_level
    when 2
      sort_level
    else
      raise WrongOptionSelectError
    end
  rescue WrongOptionSelectError => e
    puts e.message
    retry
  end

  def profile_level
    puts '1. edit employee, 2. fire employee, 3. Back'

    user_input = gets.to_i

    case user_input
    when 1
      edit_level
    when 2
      @editor.fire(@selector.employee[:last_name])
      intro_level
    when 3
      select_level
    else
      raise WrongOptionSelectError
    end
  rescue WrongOptionSelectError => e
    puts e.message
    retry
  end

  def edit_level
    puts 'What to edit?(1. first name, 2. last name, 3. job position, 4. rate, 5. hours worked, 6. experience, 7. Back)'

    user_input = gets.to_i

    edit_param =
      case user_input
      when 1
        :first_name
      when 2
        :last_name
      when 3
        :job_position
      when 4
        :rate
      when 5
        :hours_worked
      when 6
        :experience
      when 7
        :profile_level
      end

    return profile_level if edit_param == :profile_level

    @editor.edit(@selector.employee, edit_param)
    profile_level
  end

  def runner
    puts 'You launched the payroll application. v.1.0'
    loop do
      intro_level
    end
  end

  class WrongOptionSelectError < StandardError
    def initialize(message = 'Incorrect option select')
      super(message)
    end
  end
end
