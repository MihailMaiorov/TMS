# Создать свой аналог класса Array, String, Hash (на выбор).
# При этом все методы класса должны хранится в разделенных по смыслу модулях
# (модули создание, добавления, удаления, вывода, каких-либо изменений)

module Iterating
  def each
    index = 0
    while index < self.size
      yield self[index]
      index += 1
    end
  end

  def map
    results = []
    self.each { |item| results << yield(item) }

    results
  end

  def reject
    selected_items = []
    self.each { |item| selected_items << item unless yield(item) }

    selected_items
  end

  def select
    selected_items = []
    self.each { |item| selected_items << item if yield(item) }

    selected_items
  end

  def index(arg = self)
    index = 0
    self.each do |item|
      if block_given?
        return index if yield(item)
      elsif item == arg
        return index
      end
      index += 1
    end
    nil
  end

  def compact
    selected_items = []
    self.each { |item| selected_items << item unless item.nil? }

    selected_items
  end
end

module Boolean
  def empty?
    self.size.zero?
  end

  def eql?(other)
    return false unless self.size == other.size

    n = self.size - 1

    (0..n).each do |index|
      return false unless self[index] == other[index]
    end
    true
  end

  def include?(arg)
    self.each { |item| return true if item == arg }

    false
  end
end

module Countable
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
end

module Sorting
  def reverse
    results = MyArray.new(self)
    n = results.size / 2
    last_index = -1

    (0...n).each do |index|
      results[index], results[last_index] = results[last_index], results[index]
      last_index -= 1
    end
    results
  end

  def reverse!
    n = self.size / 2
    last_index = -1

    (0...n).each do |index|
      self[index], self[last_index] = self[last_index], self[index]
      last_index -= 1
    end
    self
  end

  def sort!
    n = self.size - 1
    loop do
      swap = false

      (0...n).each do |index|
        if self[index] > self[index + 1]
          self[index], self[index + 1] = self[index + 1], self[index]
          swap = true
        end
      end
      break unless swap
    end
    self
  end

  def sort
    sort_array = MyArray.new(self)
    n = sort_array.size - 1
    loop do
      swap = false

      (0...n).each do |index|
        if sort_array[index] > sort_array[index + 1]
          sort_array[index], sort_array[index + 1] = sort_array[index + 1], sort_array[index]
          swap = true
        end
      end
      break unless swap
    end
    sort_array
  end
end

class MyArray < Array
  include Iterating
  include Boolean
  include Countable
  include Sorting
end
