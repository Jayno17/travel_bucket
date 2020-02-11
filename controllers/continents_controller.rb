require_relative( '../models/continents' )
also_reload( '../models/*' )

get '/continents' do
  @continents = Continent.all()
  erb ( :"continents/index" )
end
