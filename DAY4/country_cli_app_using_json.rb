require 'json'

# Module for country analysis logic
module CountryAnalysis
  def self.can_get_loan?(country)
    gdp_threshold = 8845.63
    country['development_status'] == 'developing' && country['gdp'] < gdp_threshold
  end

  def self.is_permanent_un_member?(country)
    permanent_members = ['China', 'France', 'Russia', 'United Kingdom', 'United States']
    permanent_members.include?(country['name'])
  end

  def self.can_get_seat_in_un?(country)
    return true if is_permanent_un_member?(country)

    %w[developing developed].include?(country['development_status'])
  end

  def self.can_win_war?(country)
    country['army_strength'] > 223_000
  end
end

# Class for handling country data
class CountryDataManager
  def initialize(file_path)
    @countries = load_countries(file_path)
  end

  # Load and parse JSON data
  def load_countries(file_path)
    JSON.parse(File.read(file_path))['countries']
  rescue StandardError
    puts 'Error loading or parsing the JSON file.'
    exit
  end

  # Analyze a country by name
  def analyze_country(country_name)
    country = @countries.find { |c| c['name'].casecmp(country_name).zero? }
    return puts "No data found for #{country_name}." if country.nil?

    puts "#{country['name']} #{CountryAnalysis.can_get_loan?(country) ? 'can' : 'cannot'} get a loan."
    puts "#{country['name']} #{CountryAnalysis.can_get_seat_in_un?(country) ? 'can' : 'cannot'} have a seat at the UN."
    puts "#{country['name']} #{CountryAnalysis.can_win_war?(country) ? 'can' : 'cannot'} win a war."
  end
end

# Main program
if __FILE__ == $PROGRAM_NAME
  country_manager = CountryDataManager.new('country_data.json')
  puts 'Enter the name of the country to analyze:'
  country_name = gets.chomp.strip
  country_manager.analyze_country(country_name)
end
