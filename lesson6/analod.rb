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
    until self[index].nil?
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

arr = MyArray.new([1, 2, 3, 4])
p arr.size
arr.each { |x| puts x * 2 }
arr1 = arr.reject { |x| x > 2 }
p arr1
arr2 = arr.select { |x| x > 2 }
p arr2
arr3 = arr.map { |x| x / 2.0 }
p arr3
arr4 = arr.sum { |x| x * 2 }
p arr4
p arr.sum
p arr.sum(2)
p (1..5).sum
p arr.include?(4)
p arr.empty?
array = MyArray.new
p array.empty?
p MyArray.ancestors
