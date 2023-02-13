module ProcessingCSV
  def processed_data
    raw_data = CSV.parse(File.read(file_path), headers: true)
    data = []

    raw_data.each do |row|
      data << {
        first_name: row['first_name'],
        last_name: row['last_name'],
        job_position: row['job_position'],
        rate: row['rate'].to_i,
        hours_worked: row['hours_worked'].to_i,
        experience: row['experience'].to_i
      }
    end
    data
  end

  def reader
    processed_data.each do |employee|
      puts employee
    end
  end

  def writer(user_input)
    CSV.open(file_path, 'a', headers: true) do |csv|
      csv << user_input
    end
  end

  def deleter(last_name)
    table = CSV.table(file_path)

    table.delete_if do |row|
      row[:last_name] == last_name
    end

    File.open(file_path, 'w') do |file|
      file.write(table.to_csv)
    end
  end

  private

  def file_path
    'staff.csv'
  end
end
