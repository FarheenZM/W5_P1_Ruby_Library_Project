require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book')

get '/books' do
  @books = Book.all()
  erb(:"books/index")
end

get '/books/add_book' do
  erb(:"books/add_book")
end

post '/books/add_book' do
  book = Book.new(params)
  book.save()
  redirect '/books'
end

get '/books/edit_book/:id' do
  # need id of book to edit;
  # get id from params
  # find book by id
  # now I have a book object
  # new form to display object & edit it
  # make a post to update book
  @book = Book.find(params[:id])
  erb(:"books/edit_book")
end

post '/books/edit_book/:id' do
  book = Book.new(params)
  book.update()
  redirect '/books'
end
