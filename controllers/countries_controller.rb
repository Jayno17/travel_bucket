require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/countries' )
require_relative('../models/continents')
require_relative('..models/cities')
also_reload( '../models/*' )

get '/countries' do
  @countries = Country.all()
  erb ( :"countries/index" )
end
