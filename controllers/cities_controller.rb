require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cities' )
require_relative( '../models/countries' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  erb ( :"cities/index" )
end
