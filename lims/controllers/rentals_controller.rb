require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/rental')
require_relative('../models/book')
require_relative('../models/customer')
also_reload( '../models/*' )

get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

get '/rentals/add_rental' do
  @books = Book.all_available()
  @customers = Customer.all_who_can_rent()
  erb(:"rentals/add_rental")
end

post '/rentals/add_rental' do
  rental = Rental.new(params)
  rental.save()
  redirect '/rentals'
end

get '/rentals/delete_rental/:id' do
  Rental.delete(params[:id])
  redirect '/rentals'
end
