require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/continents' )
also_reload( '../models/*' )

get '/continets' do
  @continents = Continent.all()
  erb ( :"continents/index" )
end
