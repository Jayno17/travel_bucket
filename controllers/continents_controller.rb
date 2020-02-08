require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/continents.rb' )
require_relative( '../models/countries' )
require_relative('..models/cities')
also_reload( '../models/*' )

get '/continets' do
  @continents = Continent.all()
  erb ( :"continents/index" )
end
