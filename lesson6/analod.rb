# Создать свой аналог класса Array, String, Hash (на выбор).

class Array
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
end

arr = Array.new([1, 2, 3])
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
