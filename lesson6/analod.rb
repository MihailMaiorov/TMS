# Создать свой аналог класса Array, String, Hash (на выбор).

class MyArray < Array
  def each
    index = 0
    while index < self.size
      yield self[index]
      index += 1
    end
  end

  def map
    results = []
    self.each do |item|
      results << yield(item)
    end
    results
  end

  def reject
    selected_items = []
    self.each do |item|
      selected_items << item unless yield(item)
    end
    selected_items
  end

  def select
    selected_items = []
    self.each do |item|
      selected_items << item if yield(item)
    end
    selected_items
  end

  def sum(results = 0)
    self.each do |item|
      if block_given?
        results += yield(item)
      else
        results += item
      end
    end
    results
  end

  def size
    index = 0
    arr_size = 0
    until self[index..] == []
      index += 1
      arr_size += 1
    end
    arr_size
  end

  def include?(arg)
    self.each { |item| return true if arg == item }

    false
  end

  def empty?
    self.size.zero?
  end
end

array4 = MyArray.new([1, 2, 3, 4])
array = MyArray.new([nil])
p array4.size

array4.each { |x| puts x * 2 }

p(array4.reject { |x| x > 2 })

p(array4.select { |x| x > 2 })

p(array4.map { |x| x / 2.0 })

p(array4.sum { |x| x * 2 })

p array4.sum

p array4.sum(2)

p (1..5).sum

p array4.include?(4)

p array4.empty?

p array.empty?

p MyArray.ancestors
