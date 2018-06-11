require_relative( "../models/book.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require("pry-byebug")

Rental.delete_all()
Book.delete_all()
Customer.delete_all()

book1 = Book.new({
  "title" => "Dune",
  "category" => "Sci-Fi"
})

book2 = Book.new({
  "title" => "The diet delusion",
  "category" => "Health"
})

book3 = Book.new({
  "title" => "Blue highways",
  "category" => "Travel"
})

book4 = Book.new({
  "title" => "The power of Now",
  "category" => "Spirituality"
})

book5 = Book.new({
  "title" => "5 Ingridients - Jamie Oliver",
  "category" => "Cooking"
})

book6 = Book.new({
  "title" => "Steve Jobs",
  "category" => "Biography"
})

book1.save()
book2.save()
book3.save()
book4.save()
book5.save()
book6.save()

customer1 = Customer.new({
  "name" => "Tina Sharma",
  "postal_code" => "G1 1SJ"
})

customer2 = Customer.new({
  "name" => "Ria J",
  "postal_code" => "G3 6EQ"
})

customer3 = Customer.new({
  "name" => "Walter W",
  "postal_code" => "G1 1FQ"
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
"customer_id" => customer2.id
})

rental3 = Rental.new({
"book_id" => book3.id,
"customer_id" => customer3.id
})

rental1.save()
rental2.save()
rental3.save()


binding.pry
nil
