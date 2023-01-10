# Сумма покупок. Пользователь вводит поочередно название товара,
# цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
# а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

# 1.  запрос ввода названия, цены и кол-ва товара
# 1.1 валидация
# 1.2 стоп слово "стоп"
# 2.  создать хэш и заполнить товарами(ключ - название, значение - хэш ( цена за 1 ед и кол-во товара) )
# 2.1 вывести хэш
# 3.  вывести итого за каждый товар
# 4.  вывести итого за все товары

def user_input(welcome_msg: nil, validator: nil, error_msg: nil)
  loop do
    puts welcome_msg unless welcome_msg.nil?

    value = gets.strip

    return value if validator.nil? || validator.call(value)

    puts error_msg unless error_msg.nil?
  end
end

shopping_basket = {}

loop do
  title = user_input(welcome_msg: "Enter product title(Enter 'stop' for exit)",
                     validator: ->(value) { !shopping_basket.key?(value) && !value.empty? },
                     error_msg: 'This product title cannot be added')

  break if title.downcase == 'stop'

  price = user_input(welcome_msg: 'Enter product price',
                     validator: ->(value) { value.to_f.positive? },
                     error_msg: 'Product price must be iteger greater then 0').to_f

  count = user_input(welcome_msg: 'Enter product count',
                     validator: ->(value) { value.to_i.positive? },
                     error_msg: 'Product count must be iteger greater then 0').to_i

  shopping_basket[title] = { 'price' => price, 'count' => count }

  shopping_basket.each { |product, value| puts "'#{product}': price #{value['price']}, count #{value['count']}" }
end

product_price_total = {}

shopping_basket.each { |title, value| product_price_total[title] = value['price'] * value['count'] }

product_price_total.each { |title, price| puts "Total price for #{title} = $#{price}" }

total_price = product_price_total.values.sum

puts "\nTotal price for all products: $#{total_price}"
