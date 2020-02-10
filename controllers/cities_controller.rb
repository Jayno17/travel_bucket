require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cities' )
require_relative( '../models/countries' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  erb ( :"cities/index" )
end

get '/cities/new' do
  @countries = Country.all()
  erb (:"cities/new")
end

post '/cities' do
  City.new(params).save
  redirect '/cities'
end

get '/cities/:id' do
  @city = City.find(params['id'])
  erb (:show)
end
