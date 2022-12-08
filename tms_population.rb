class UserData
  def user_input
    puts 'Enter population'
    @population = gets.to_i
    puts 'Enter fertility'
    @fertility = gets.to_i
    puts 'Enter mortality'
    @mortality = gets.to_i
  end
end

class Population < UserData
  def calculate_population(population: 10_000_000, fertility: 14, mortality: 8, years: 0)
    @population = @population + @population / 1000 * @fertility - @population / 1000 * @mortality
    years += 1
    puts @population if years == 10
    return if years >= 10

    calculate_population(population: @population, years: years)
  end
end

a = Population.new
a.user_input
a.calculate_population
