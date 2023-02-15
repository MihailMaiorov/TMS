require 'csv'
require_relative 'processing_csv'

class Sorter
  include ProcessingCSV

  def sorter(param)
    processed_data.sort_by { |employee| employee[param].downcase }
  end
end
