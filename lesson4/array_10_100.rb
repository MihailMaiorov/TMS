# Заполнить массив числами от 10 до 100 с шагом 5

array = (10..100).select { |x| (x % 5).zero? }

print array
