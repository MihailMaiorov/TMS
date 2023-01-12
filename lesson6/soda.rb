# Создать класс Soda (для определения типа газировки),
# принимающий 1 аргумент при инициализации (отвечающий за добавку к выбираемому лимонаду).
# В этом классе реализуйте метод show my drink(),
# выводящий на печать «Газировка и {ДОБАВКА}» в случае наличия добавки,
# а иначе отобразится следующая фраза: «Обычная газировка».
class Soda
  attr_reader :additive

  def initialize(additive = nil)
    @additive = additive
  end

  def show_my_drink
    if additive.nil?
      puts 'Regular soda.'
    else
      puts "Soda and #{additive}."
    end
  end
end

b = Soda.new('Milk')
b.show_my_drink
