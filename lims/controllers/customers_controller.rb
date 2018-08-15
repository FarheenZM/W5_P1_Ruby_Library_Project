require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/customer')
also_reload( '../models/*' )


get '/customers' do
  @customers = Customer.all()
  erb(:"customers/index")
end

# add new customer
get '/customers/add_customer' do
  # opens form
  # accepts details i.e params
  # create new object with params
  erb(:"customers/add_customer")
end

post '/customers/add_customer' do
  customer = Customer.new(params)
  customer.save()
  redirect '/customers'
end

# update existing customer details
get '/customers/edit_customer/:id' do
  @customer = Customer.find(params[:id])
  erb(:"customers/edit_customer")
end

post '/customers/edit_customer/:id' do
  customer = Customer.new(params)
  customer.update()
  redirect '/customers'
end

# remove customers
get '/customers/delete_customer/:id' do
  Customer.delete(params[:id])
  redirect '/customers'
end
