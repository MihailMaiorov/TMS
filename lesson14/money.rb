require 'csv'
# require 'yaml'
class Employee
  attr_reader :args
  def initialize(args)
    @args = args
  end
  class << self
    def add(worker)
      staff = File.write('staff.txt', "\n#{worker}", mode: 'a')
    end

    def update(worker)
      staff = File.read("staff.txt")

      # filtered_staff = staff.gsub("worker", "latest")
      
    end
  end
end
# all_worker = YAML.safe_load_file('staff.yml', symbolize_names: true)
# all_worker.each do |worker|
#   puts worker[:name]
# end

# def update(params)
#   settings = load_settings
#   params.each do |key, value|
#     # key = key.to_s
#     settings[key] = value
#   end
#   save_settings(settings)
# end

# def load_settings
#   @config ||= YAML.safe_load_file('staff.yml', symbolize_names: true)
# end

# def save_settings(settings)
#   File.write('staff.yml', settings.to_yaml)
# end
# update({'name' => 'Alex'})
# Worker.add('Alex Ovechkin, hokky, 399, 100, 12')
# Worker.add('Alex Ovechk, hokky, 22, 13, 1')

# content = File.read('staff.txt', mode: 'r') #{ |text| line = text.readlines }
# p content = content.split("\n")
# p content.select { |x| x.include?('22') }


# # data = File.read("hello.txt") 

# # filtered_data = data.gsub("install", "latest") 

# # File.open("hello.txt", "w") do |f|
# #   f << filtered_data
# # end
# $stdin = File.open('staff.txt')
# $stdout = File.open('выходные данные.txt', 'w')
# $stderr = File.open('сообщения об ошибках.txt', 'a')

# puts 'Очень важные данные,'
# puts 'которые будут сохранены в файл'
# raise 'Принудительно вызываем ошибку'
# csv = CSV.read('staff.csv')

# # csv.read(headers: true)

# # csv.each do |row|
# #   puts row['name']
# # end
# def handle_row(row)
#   puts row['name']
# end

# parse_csv(csv, method(handle_row))

# def parse_csv(file, method)
#   CSV.foreach(file, encoding: 'UTF-8', headers: true, &method)
# end

table = CSV.parse(File.read('staff.csv'), headers: true)
@arr = []
table.each do |row|
  @arr << {
    name: row['name'],
    surname: row['surname'],
    job_position: row['job_position'],
    rate: row['rate'],
    hours_worked: row['hours_worked'],
    experience: row['experience']
  }
end

def sorter(arg)
  q = @arr.sort_by { |x| x[arg].downcase }.map do |a|
    puts a.values.join(',')
  end
   
 
  
end

def sortered_by_name
  sorter(:rate)
end

sortered_by_name
# CSV.open('staff.csv', "a", headers: true) do |csv|
#   csv << ['name', 5]
# end
