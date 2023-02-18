require_relative 'staff'
require_relative 'employee'

class Engine
  def initialize
    @staff = Staff.new
    @employee = Employee.new
  end

  def runner
    puts 'You launched the payroll application. v.1.0'
    loop do
      intro_level
    end
  end

  private

  def intro_level
    puts '1. Show all employees, 2. Sort employees, 3. Add employee, 4. Calculate salary, 5. Quit'
    puts 'Enter a number(1, 2, 3, 4, 5)'

    user_input = gets.to_i

    case user_input
    when 1
      @staff.info
    when 2
      sort_level
    when 3
      @employee.create

      puts 'New employee successfully added'
    when 4
      puts @employee.calculate_salary
    when 5
      exit
    else
      raise WrongOptionSelectError
    end
  rescue WrongOptionSelectError => e
    puts e.message
    retry
  end

  def sort_level
    puts 'How to sort?(1. First name, 2. Last name, 3. Job position, 4. Rate, 5. Hours worked, 6. Experience, 7. Back)'

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
        raise WrongOptionSelectError
      end

    puts @staff.sort_by_params(sort_param)
    select_level
  rescue WrongOptionSelectError => e
    puts e.message
    retry
  end

  def select_level
    puts '1. Select employeer, 2. Back'

    user_input = gets.to_i

    case user_input
    when 1
      @staff.select_by_last_name
      puts @staff.employee
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
    puts '1. Update employee data , 2. Fire employee, 3. Back'

    user_input = gets.to_i

    case user_input
    when 1
      update_level
    when 2
      @employee.fire(@staff.employee[:last_name])
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

  def update_level
    puts 'What to edit?(1. First name, 2. Last name, 3. Job position, 4. Rate, 5. Hours worked, 6. Experience, 7. Back)'

    user_input = gets.to_i

    header =
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
        return profile_level
      else
        raise WrongOptionSelectError
      end

    @employee.update(@staff.employee, header)
    profile_level
  rescue WrongOptionSelectError => e
    puts e.message
    retry
  end

  class WrongOptionSelectError < StandardError
    def initialize(message = 'Incorrect option select')
      super(message)
    end
  end
end
