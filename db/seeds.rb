require_relative('../models/continents')
require_relative('../models/countries')
require_relative('../models/cities')
require('pry-byebug')

City.delete_all()
Country.delete_all()
Continent.delete_all()

continent1 = Continent.new({ "name" => "Asia"})
continent2 = Continent.new({ "name" => "Africa"})
continent3 = Continent.new({ "name" => "Americas"})
continent4 = Continent.new({ "name" => "Europe"})
continent5 = Continent.new({ "name" => "Australia"})

continent1.save
continent2.save
continent3.save
continent4.save
continent5.save

country1 = Country.new({
  "name" => "South Africa",
  "continent_id" => continent2.id
  })
country1.save

country2 = Country.new({
  "name" => "France",
  "continent_id" => continent4.id
  })
country2.save

country3 = Country.new({
  "name" => "Canada",
  "continent_id" => continent3.id
  })
country3.save

country4 = Country.new({
  "name" => "Australia",
  "continent_id" => continent5.id
  })
country4.save

country5 = Country.new({
  "name" => "India",
  "continent_id" => continent1.id
  })
country5.save

city1 = City.new({
  "name" => "Delhi",
  "country_id" => country5.id,
  "visited" => true
  })
city1.save

city2 = City.new({
  "name" => "Sydney",
  "country_id" => country4.id,
  "visited" => false
  })
city2.save

city3 = City.new({
  "name" => "Toronto",
  "country_id" => country3.id,
  "visited" => "true"
  })
city3.save

city4 = City.new({
  "name" => "Paris",
  "country_id" => country2.id,
  "visited" => true
  })
city4.save

city5 = City.new({
  "name" => "Cape Town",
  "country_id" => country1.id,
  "visited" => true
  })
  city5.save

binding.pry
nil
