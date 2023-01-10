require_relative 'shopping_basket'
require_relative 'file_writer'
require_relative 'input_reader'

class Engine
  def initialize
    @shopping_basket = ShoppingBasket.new
    @input_reader = InputReader.new

    name = @input_reader.read(welcome_msg: 'Enter your name',
                              validator: ->(value) { !value.empty? },
                              error_msg: "Name can't be blank")

    current_time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')

    @file_writer = FileWriter.new('a', name, current_time)

    @file_writer.write("Check for #{name}\n#{current_time}\n")
  end

  def run
    product_price_total = {}

    shopping_basket = @shopping_basket.basket

    shopping_basket.each do |title, value|
      product_price_total[title] = value['price'] * value['count']
      @file_writer.write("\n#{format(
        '%10s : %3d * $%5.2f = $%5.2f', title, value['count'], value['price'], value['price'] * value['count']
      )}")
    end

    product_price_total.each { |title, price| puts "Total price for #{title}: $#{price}" }

    total_price = product_price_total.values.sum

    puts "Total price for all products: $#{total_price}"

    @file_writer.write("\n\nTotal: $#{total_price}")
  end
end
