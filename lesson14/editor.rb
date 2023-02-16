require 'csv'
require_relative 'processing_csv'

class Editor
  include ProcessingCSV

  def edit(employee, header)
    print "Enter new #{header}: "
    new_value = gets.strip

    csv_edit(header, employee[:last_name], new_value)

    puts "#{header} successfully edit."
  end

  def fire(last_name)
    csv_delete(last_name)

    puts 'Employee fired'
  end
end
