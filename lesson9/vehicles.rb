# 1) Создать класс Car в модуле Vehicles, класс Engine в модуле Professions.
# 2) Класс Driver содержит поля - ФИО, стаж вождения.
# 3) Класс Engine содержит поля - мощность, производитель.
# 4) Класс Car содержит поля - марка автомобиля, класс автомобиля, вес, водитель типа Driver,
#    мотор типа Engine. Методы start(), stop(), turnRight(), turnLeft(),
#    которые выводят на печать: "Поехали", "Останавливаемся", "Поворот направо" или "Поворот налево".
#    А также метод to s(), который выводит полную информацию об автомобиле, ее водителе и моторе. 
# 5) Создать производный от Car класс  - Lorry (грузовик),
#    характеризуемый также грузоподъемностью кузова.
# 6) Создать производный от Car класс - SportCar, характеризуемый также предельной скоростью.
# 7) Пусть класс Driver расширяет класс Person.

module Vehicles
  class Car
    attr_reader :car_model, :car_class, :weight, :driver, :engine, :params

    def initialize(params)
      params.each do |name, value|
        self.instance_variable_set("@#{name}", value)
      end
    end

    def start
      puts 'Go'
    end

    def stop
      puts 'We stop'
    end

    def turn_right
      puts 'Right turn'
    end

    def turn_left
      puts 'Left turn'
    end

    def full_info
      puts "\nDriver: #{driver.full_name}, driving experience: #{driver.driving_experience}"
      puts "Engine: #{engine.manufacturer}, power: #{engine.power}"
      puts "car_model: #{car_model}"
      puts "car_class: #{car_class}"
      puts "weight: #{weight}"
    end
  end
end

module Professions
  class Engine
    attr_reader :power, :manufacturer

    def initialize(power, manufacturer)
      @power = power
      @manufacturer = manufacturer
    end
  end
end

class Lorry < Vehicles::Car
  attr_reader :body_load_capacity

  def initialize(params)
    super
    @body_load_capacity = params[:body_load_capacity]
  end

  def full_info
    super
    puts "body load capacity: #{body_load_capacity}"
  end
end

class SportCar < Vehicles::Car
  attr_reader :max_speed

  def initialize(params)
    super
    @max_speed = params[:max_speed]
  end

  def full_info
    super
    puts "max speed: #{max_speed}"
  end
end

class Driver
  attr_reader :full_name, :driving_experience

  def initialize(full_name, driving_experience)
    @full_name = full_name
    @driving_experience = driving_experience
  end
end

class Person < Driver; end

nikolay = Driver.new('Nikolay Ivanov', 10)
vasiliy = Driver.new('Vasiliy Alibabaevich', 8)

lorry_engin = Professions::Engine.new(350, 'Mersedes')
sport_engin = Professions::Engine.new(500, 'Ferrari')

ferrari = SportCar.new(
  {
    car_model: 'Ferrari',
    car_class: 'F40',
    weight: 1200,
    driver: nikolay,
    engine: sport_engin,
    max_speed: 310
  }
)
actros = Lorry.new(
  {
    car_model: 'Mersedes',
    car_class: 'Actros',
    weight: 5500,
    driver: vasiliy,
    engine: lorry_engin,
    body_load_capacity: 20_000
  }
)

ferrari.full_info
actros.full_info
