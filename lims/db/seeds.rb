require_relative( "../models/book.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require("pry-byebug")

Rental.delete_all()
Book.delete_all()
Customer.delete_all()

book1 = Book.new({
  "title" => "Book 1",
  "category" => "Science",
  "available" => "Yes"
})

book2 = Book.new({
  "title" => "Book 2",
  "category" => "Fiction",
  "available" => "Yes"
})

book1.save()
book2.save()

customer1 = Customer.new({
  "name" => "Tina",
  "postal_code" => "G1 1SJ",
  "rented_book_count" => 0
})

customer2 = Customer.new({
  "name" => "Ria",
  "postal_code" => "G3 6EQ",
  "rented_book_count" => 0
})

customer3 = Customer.new({
  "name" => "Walter",
  "postal_code" => "G1 1FQ",
  "rented_book_count" => 0
})

customer1.save()
customer2.save()
customer3.save()

rental1 = Rental.new({
"book_id" => book1.id,
"customer_id" => customer1.id
})

rental2 = Rental.new({
"book_id" => book2.id,
"customer_id" => customer3.id
})

rental1.save()
rental2.save()


binding.pry
nil
