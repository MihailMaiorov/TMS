# Взять несколько предметов, которые вас окружают, и описать их, как классы.
# Создать по объекту каждого класса, сравнить их поведение.

class Smartphone
  attr_reader :brand, :model

  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def info
    puts "My phone is #{brand}: #{model}"
  end

  def make_call(contact)
    puts "Calling a #{contact}."
  end

  def end_the_call
    puts 'Сall ended.'
  end

  def send_message(contact, text)
    puts "Message: '#{text}' sent to '#{contact}'."
  end

  def system_update
    puts 'System updated to latest version'
  end
end

iphone = Smartphone.new('Apple', 'Iphone X')
iphone.info
iphone.make_call('Mike')
iphone.send_message('Mike', 'Hi bro!')
