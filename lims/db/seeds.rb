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

book7 = Book.new({
  "title" => "Mary Berry's Baking Bible",
  "category" => "Cooking"
})

book8 = Book.new({
  "title" => "Wheat Belly",
  "category" => "Health"
})

book9 = Book.new({
  "title" => "The 4-Hour Body",
  "category" => "Health"
})

book10 = Book.new({
  "title" => "The Time Machine",
  "category" => "Sci-Fi"
})

book11 = Book.new({
  "title" => "The Art of War",
  "category" => "History"
})

book12 = Book.new({
  "title" => "Digital Photography",
  "category" => "Art"
})

book13 = Book.new({
  "title" => "The Odyssey",
  "category" => "Poetry"
})

book14 = Book.new({
  "title" => "Ghost World",
  "category" => "Comics"
})

book1.save()
book2.save()
book3.save()
book4.save()
book5.save()
book6.save()
book7.save()
book8.save()
book9.save()
book10.save()
book11.save()
book12.save()
book13.save()
book14.save()

customer1 = Customer.new({
  "name" => "Tina Sharma",
  "address" => "Street A, G1 1SJ"
})

customer2 = Customer.new({
  "name" => "Ria Kapoor",
  "address" => "Street B, G3 6EQ"
})

customer3 = Customer.new({
  "name" => "Walter W",
  "address" => "Street C, G1 1FQ"
})

customer4 = Customer.new({
  "name" => "Jessie Pinkman",
  "address" => "Street D, G2 15S"
})

customer5 = Customer.new({
  "name" => "Raj",
  "address" => "Street E, G1 61Q"
})

customer6 = Customer.new({
  "name" => "Sheldon",
  "address" => "Street F, G3 1OQ"
})

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()

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

rental4 = Rental.new({
"book_id" => book4.id,
"customer_id" => customer1.id
})

rental5 = Rental.new({
"book_id" => book5.id,
"customer_id" => customer4.id
})

rental6 = Rental.new({
"book_id" => book6.id,
"customer_id" => customer5.id
})

rental1.save()
rental2.save()
rental3.save()
rental4.save()
rental5.save()
rental6.save()

binding.pry
nil
