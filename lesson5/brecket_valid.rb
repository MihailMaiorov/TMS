def valid?(str)
  bracket_mapping = { ')' => '(', ']' => '[', '}' => '{' }
  stack = []

  str.each_char do |bracket|
    if bracket_mapping.value?(bracket)
      stack.push(bracket)
    elsif bracket_mapping.key?(bracket)
      return false if stack.size.zero? || bracket_mapping[bracket] != stack.last

      stack.pop
    end
  end

  stack.size.zero?
end

puts valid?('(x{f})[]')
