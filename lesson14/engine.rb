require 'csv'
require_relative 'parser'
require_relative 'sorter'
require_relative 'selector'
require_relative 'employee'

class Engine
  include Parser

  def initialize
    @sorter = Sorter.new
    @selector = Selector.new
    @employee = Employee.new
  end

  def first
    puts '1. Show all employees, 2. Sort employees, 3. Add employee, 4. Quit'
    puts 'Enter a number(1, 2, 3, 4)'

    user_input = gets.to_i

    case user_input
    when 1
      Engine.new.reader
    when 2
      second
    when 3
      @employee.add
    when 4
      exit
    end
  end

  def second
    puts 'How to sort?(1. first name, 2. last name, 3. job position, 4. rate, 5. hours worked, 6. experience, 7. Back)'

    user_input2 = gets.to_i

    case user_input2
    when 1
      @sorter.sortered_by_first_name
      third
    when 2
      @sorter.sortered_by_last_name
      third
    when 3
      @sorter.sortered_by_job_position
      third
    when 4
      @sorter.sortered_by_rate
      third
    when 5
      @sorter.sortered_by_hours_worked
      third
    when 6
      @sorter.sortered_by_experience
      third
    when 7
      first
    end
  end

  def third
    puts '1. select employeer, 2. Back'

    user_input3 = gets.to_i

    case user_input3
    when 1
      @selector.select_by_last_name
      four
    when 2
      second
    end
  end

  def four
    puts '1. edit employee, 2. fire employee, 3. Back'

    user_input4 = gets.to_i

    case user_input4
    when 1
      puts 'Hi1'
    when 2
      puts 'Hi2'
    when 3
      third
    end
  end

  def runner
    puts 'You launched the payroll application. v.1.0'
    first
  end
end

Engine.new.runner
