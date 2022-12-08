class UserInput
  def user_value
    loop do
      puts 'Enter spruce height(min 3)'
      @user_value = gets.to_i
      break unless @user_value < 3
    end
  end
end

class Spruce < UserInput
  def tree_cultivation
    heigth = @user_value
    space = ' '
    lattice = '#'
    @user_value.times do
      puts "#{space * (heigth - 2)}#{lattice}"
      heigth -= 1
      lattice += '##'
      if heigth == 1
        puts "#{space * (@user_value - 2)}#"
        break
      end
    end
  end
end
spruce = Spruce.new
spruce.user_value
spruce.tree_cultivation
