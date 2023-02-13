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
    puts '1. Show all employees, 2. Sort employees, 3. Add employee, 4. Quit'
    puts 'Enter a number(1, 2, 3, 4)'

    user_input = gets.to_i

    case user_input
    when 1
      Engine.new.reader
    when 2
      sort_level
    when 3
      @employee.add
    when 4
      exit
    end
  end

  def sort_level
    puts 'How to sort?(1. first name, 2. last name, 3. job position, 4. rate, 5. hours worked, 6. experience, 7. Back)'

    user_input2 = gets.to_i

    case user_input2
    when 1
      puts @sorter.sortered_by_first_name
      select_level
    when 2
      puts @sorter.sortered_by_last_name
      select_level
    when 3
      puts @sorter.sortered_by_job_position
      select_level
    when 4
      puts @sorter.sortered_by_rate
      select_level
    when 5
      puts @sorter.sortered_by_hours_worked
      select_level
    when 6
      puts @sorter.sortered_by_experience
      select_level
    when 7
      intro_level
    end
  end

  def select_level
    puts '1. select employeer, 2. Back'

    user_input3 = gets.to_i

    case user_input3
    when 1
      @selector.select_by_last_name
      puts @selector.employee
      edit_level
    when 2
      sort_level
    end
  end

  def edit_level
    puts '1. edit employee, 2. fire employee, 3. Back'

    user_input4 = gets.to_i

    case user_input4
    when 1
      puts @selector.employee
    when 2
      @editor.fire(@selector.employee[:last_name])
      intro_level
    when 3
      select_level
    end
  end

  def runner
    puts 'You launched the payroll application. v.1.0'
    intro_level
  end
end

Engine.new.runner
