module Parser
  def processed_data
    raw_data = CSV.parse(File.read('staff.csv'), headers: true)
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
end
