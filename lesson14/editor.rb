require 'csv'
require_relative 'processing_csv'

class Editor
  include ProcessingCSV

  def edit

  end

  def fire(last_name)
    deleter(last_name)

    puts 'Employee fired'
  end
end
