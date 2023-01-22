# 1) Создать класс Товар, имеющий переменные имя, цена, рейтинг. 
# 2) Создать класс Категория, имеющий переменные имя и массив товаров.
#    Создать несколько объектов класса Категория. 
# 3) Создать класс Basket, содержащий массив купленных товаров. 
# 4) Создать класс User, содержащий логин, пароль и объект класса Basket.
#    Создать несколько объектов класса User.
# 5) Вывести на консоль каталог продуктов.
# 6) Вывести на консоль покупки посетителей магазина.

class Product
  attr_reader :title, :price, :rating

  def initialize(title, price, rating)
    @title = title
    @price = price
    @rating = rating
  end
end

class Category
  attr_reader :category, :products

  def initialize(category, *products)
    @category = category
    @products = products
  end

  def catalog
    puts "#{category}: #{products.map(&:title).join(', ')}"
  end
end

class Basket
  attr_reader :purchased_product

  def initialize(*purchased_product)
    @purchased_product = purchased_product
  end
end

class User
  attr_reader :login, :password, :basket

  def initialize(login, password, basket)
    @login = login
    @password = password
    @basket = basket
  end

  def purchases
    product_titles = []

    basket.purchased_product.each { |product| product_titles << product.title }

    puts "#{login} bought: #{product_titles.join(', ')}"
  end
end

milk = Product.new('milk', 2, 5)
kefir = Product.new('kefir', 2.3, 5)
meat = Product.new('meat', 10, 4)
sausage = Product.new('sausage', 6, 3)

milk_products = Category.new('milk products', milk, kefir)
meat_products = Category.new('meat products', meat, sausage)

basket = Basket.new(milk, meat)
basket2 = Basket.new(kefir, sausage)

alesha = User.new('deflorator2009', 1111, basket)
vasia = User.new('lopatakopaet', 2222, basket2)

milk_products.catalog
meat_products.catalog
alesha.purchases
vasia.purchases
