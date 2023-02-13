require 'csv'
require_relative 'processing_csv'

class Sorter
  include ProcessingCSV

  def sorter(arg)
    processed_data.sort_by { |employee| employee[arg] }
  end

  def sortered_by_first_name
    sorter(:first_name)
  end

  def sortered_by_last_name
    sorter(:last_name)
  end

  def sortered_by_job_position
    sorter(:job_position)
  end

  def sortered_by_rate
    sorter(:rate)
  end

  def sortered_by_hours_worked
    sorter(:hours_worked)
  end

  def sortered_by_experience
    sorter(:experience)
  end
end
