require 'csv'
require_relative 'processing_csv'

class Editor
  include ProcessingCSV

  def edit(employee, header)
    print "Enter new #{header}: "
    new_value = gets.strip

    editor(header, employee[:last_name], new_value)

    puts 'Last name successfully edit.'
  end

  def fire(last_name)
    deleter(last_name)

    puts 'Employee fired'
  end
end
