# frozen_string_literal: true

class CountriesData
  def self.data
    {
      countries: [
        {
          name: 'India',
          population: 1_393_409_038,
          gdp: 2_875.14, # in billion USD
          states: ['Maharashtra', 'Uttar Pradesh', 'Bihar'],
          army_strength: 1_390_000,
          development_status: 'developing'
        },
        {
          name: 'Germany',
          population: 83_783_942,
          gdp: 3_845.63, # in billion USD
          states: %w[Bavaria Berlin Hesse],
          army_strength: 184_000,
          development_status: 'developed'
        },
        {
          name: 'United States',
          population: 331_002_651,
          gdp: 21_137.00, # in billion USD
          states: %w[California Texas Florida],
          army_strength: 1_400_000,
          development_status: 'developed'
        },
        {
          name: 'Brazil',
          population: 212_559_417,
          gdp: 1_846.73, # in billion USD
          states: ['São Paulo', 'Rio de Janeiro', 'Bahia'],
          army_strength: 334_500,
          development_status: 'developing'
        },
        {
          name: 'Nigeria',
          population: 206_139_589,
          gdp: 448.12, # in billion USD
          states: %w[Lagos Kano Rivers],
          army_strength: 223_000,
          development_status: 'developing'
        }
      ]
    }
  end
end
