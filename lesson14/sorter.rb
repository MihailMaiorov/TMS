require 'csv'
require_relative 'parser'

class Sorter
  include Parser

  def sorter(arg)
    processed_data.sort_by { |employee| employee[arg] }
  end

  def sortered_by_first_name
    puts sorter(:first_name)
  end

  def sortered_by_last_name
    puts sorter(:last_name)
  end

  def sortered_by_job_position
    puts sorter(:job_position)
  end

  def sortered_by_rate
    puts sorter(:rate)
  end

  def sortered_by_hours_worked
    puts sorter(:hours_worked)
  end

  def sortered_by_experience
    puts sorter(:experience)
  end
end
