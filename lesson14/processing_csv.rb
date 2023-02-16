require 'fileutils'

module ProcessingCSV
  CSV_HEADERS = %w[first_name last_name job_position rate hours_worked experience].freeze

  def processed_data
    raw_data = CSV.parse(File.read(file_name), headers: true, header_converters: :symbol, converters: :all)
    data = []

    raw_data.each do |row|
      data << {
        first_name: row[:first_name],
        last_name: row[:last_name],
        job_position: row[:job_position],
        rate: row[:rate],
        hours_worked: row[:hours_worked],
        experience: row[:experience]
      }
    end
    data
  end

  def csv_read
    processed_data.each do |employee|
      puts employee
    end
  end

  def csv_write(new_value)
    CSV.open(file_name, 'a', headers: true) do |csv|
      csv << new_value
    end
  end

  def csv_delete(last_name)
    table = CSV.table(file_name)

    table.delete_if do |row|
      row[:last_name] == last_name
    end

    File.open(file_name, 'w') do |file|
      file.write(table.to_csv)
    end
  end

  def csv_edit(header, last_name, new_value)
    write_parameters = {
      write_headers: true,
      headers: CSV_HEADERS
    }
    read_parameters = {
      encoding: 'UTF-8',
      headers: true,
      header_converters: :symbol,
      converters: :all
    }

    CSV.open('new_data.csv', 'w+', **write_parameters) do |new_csv|
      CSV.foreach(file_name, **read_parameters) do |row|
        row[header] = new_value if row[:last_name] == last_name
        new_csv << row
      end
    end

    FileUtils.move('new_data.csv', file_name)
  end

  private

  def file_name
    'staff.csv'
  end
end
