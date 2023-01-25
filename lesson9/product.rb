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

  def initialize(category)
    @category = category
    @products = {}
  end

  def add(new_product)
    products[new_product] = { title: new_product.title, price: new_product.price, rating: new_product.rating }
  end

  def add_all(*new_products)
    new_products.each do |product|
      products[product] = { title: product.title, price: product.price, rating: product.rating }
    end
  end

  def info
    products.values.join(', ')
  end

  def catalog
    puts "#{category}: #{info}"
  end
end

class Basket
  attr_reader :products

  def initialize
    @products = {}
  end

  def info
    products.values.join(', ')
  end
end

class User
  attr_reader :login, :password, :basket

  def initialize(login, password)
    @login = login
    @password = password
    @basket = Basket.new
    @user_info = login
  end

  def add_product(added_product)
    basket.products[added_product] = { title: added_product.title, price: added_product.price, rating: added_product.rating }
  end

  def add_all_products(*added_products)
    added_products.each do |product|
      basket.products[product] = { title: product.title, price: product.price, rating: product.rating }
    end
  end

  def purchases
    puts "#{login} bought: #{basket.info}"
  end
end

milk = Product.new('Milk', 2, 5)
kefir = Product.new('Kefir', 2.3, 5)
meat = Product.new('Meat', 10, 4)
meat1 = Product.new('Meat', 20, 8)
sausage = Product.new('Sausage', 6, 3)

milk_products = Category.new('Milk products')
meat_products = Category.new('Meat products')
milk_products.add(milk)
milk_products.add(kefir)
meat_products.add_all(meat, sausage, meat1)

alesha = User.new('Alex', 1111)
vasia = User.new('Max', 2222)
alesha.add_product(milk)
alesha.add_product(kefir)
vasia.add_all_products(meat1, sausage, meat)

milk_products.catalog
meat_products.catalog
alesha.purchases
vasia.purchases
