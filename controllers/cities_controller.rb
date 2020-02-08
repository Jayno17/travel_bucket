require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cities.rb' )
require_relative( '../models/countries' )
require_relative('../models/continents')
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  erb ( :"cities/index" )
end
