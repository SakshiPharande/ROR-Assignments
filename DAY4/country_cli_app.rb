# frozen_string_literal: true

require './country_data'

# Corrected module name
module CountryModule
  def can_get_loan?(country)
    gdp_threshold = 8_845.63
    country[:development_status] == 'developing' && country[:gdp] < gdp_threshold
  end

  def can_get_seat_in_un(country)
    permanent_members = ['China', 'France', 'Russia', 'United Kingdom', 'United States']
    if permanent_members.include?(country[:name])
      puts "#{country[:name]} is a permanent member of the UN Security Council."
      return true
    end
    %w[developing developed].include?(country[:development_status])
  end

  def can_win_war?(country)
    country[:army_strength] > 223_000
  end
end

class CountryClass
  include CountryModule

  attr_reader :data

  def initialize(data)
    @data = data[:countries]
  end

  def analyze_country(country_name)
    country = @data.find { |c| c[:name] == country_name }

    if country.nil?
      puts "#{country_name} data not available."
      return
    end

    loan_status = can_get_loan?(country) ? 'can get a loan.' : 'cannot get a loan.'
    puts "#{country_name} #{loan_status}"

    un_seat_status = can_get_seat_un(country) ? "#{country_name} can have a seat at the UN." : "#{country_name} cannot have a seat at the UN."
    puts un_seat_status

    war_status = can_win_war?(country) ? "#{country_name} can win a war." : "#{country_name} cannot win a war."
    puts war_status
  end
end

# Example of using the class and module
countries_class = CountryClass.new(CountriesData.data)

puts 'Enter the name of the country you want to analyze:'
country_name = gets.chomp.strip.capitalize

# Analyze the specified country
countries_class.analyze_country(country_name)
