require_relative 'input_reader'

class ShoppingBasket
  def initialize
    @input_reader = InputReader.new
  end

  def basket
    basket = {}

    loop do
      title = @input_reader.read(welcome_msg: "Enter product title(Enter 'stop' for exit)",
                                 validator: ->(value) { !basket.key?(value) && !value.empty? },
                                 error_msg: 'This product title cannot be added')

      return basket if title.downcase == 'stop'

      price = @input_reader.read(welcome_msg: 'Enter product price',
                                 validator: ->(value) { value.to_f.positive? },
                                 error_msg: 'Product price must be iteger greater then 0').to_f

      count = @input_reader.read(welcome_msg: 'Enter product count',
                                 validator: ->(value) { value.to_i.positive? },
                                 error_msg: 'Product count must be iteger greater then 0').to_i

      basket[title] = { 'price' => price, 'count' => count }

      basket.each { |product, value| puts "'#{product}': price $#{value['price']}, count #{value['count']}" }
    end
  end
end
