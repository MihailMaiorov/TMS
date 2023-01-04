# Заполнить хеш гласными буквами,
# где значением будет являтся порядковый номер буквы в алфавите (a - 1).

letters_index = {}

('a'..'z').each_with_index { |letter, index| letters_index[letter] = index + 1 }

vowel_letters = letters_index.select { |letter| %w[a e i o u y].include?(letter) }

puts vowel_letters
