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

# add new rental;
# should display list of available books
# should check if a customer already has a book
get '/rentals/add_rental' do
  @books = Book.all()
  @customers = Customer.all()
  erb(:"rentals/add_rental")
end

post '/rentals/add_rental' do
  rental = Rental.new(params)
  rental.save()
  redirect '/rentals'
end

# delete a rental i.e returning a book
get '/rentals/delete_rental/:id' do
  Rental.delete(params[:id])
  redirect '/rentals'
end
