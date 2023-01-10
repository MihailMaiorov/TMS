# Заполнить хеш гласными буквами,
# где значением будет являтся порядковый номер буквы в алфавите (a - 1).

vowel_index = {}
vowel_letters = %w[a e i o u y]

('a'..'z').each_with_index do |letter, index|
  if vowel_letters.include?(letter)
    vowel_index[letter] = index + 1
    next
  end
end

puts vowel_index
