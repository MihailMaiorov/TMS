game_round = (1..100).to_a
game_result = []
game_round.each do |number|
  game_result <<
    if (number % 3).zero?
      if (number % 5).zero?
        'fizzbuzz'
      else
        'fizz'
      end
    elsif (number % 5).zero?
      'buzz'
    else
      number
    end
end
puts game_result.join(', ')
