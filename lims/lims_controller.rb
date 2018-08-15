require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/books_controller')
require_relative('controllers/customers_controller')
require_relative('controllers/rentals_controller')
also_reload('./models/*')

get '/' do
  erb( :index )
end
