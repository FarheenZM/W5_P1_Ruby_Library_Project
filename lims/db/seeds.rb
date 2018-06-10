require_relative( "../models/book.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require("pry-byebug")

Rental.delete_all()
Book.delete_all()
Customer.delete_all()

book1 = Book.new({
  "title" => "science",
  "category" => "A",
  "available" => "Yes"
})

book2 = Book.new({
  "title" => "history",
  "category" => "B",
  "available" => "Yes"
})

book1.save()
book2.save()

customer1 = Customer.new({
  "name" => "Tina"
})

customer2 = Customer.new({
  "name" => "Ria"
})

customer3 = Customer.new({
  "name" => "Walter"
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
"customer_id" => customer1.id
})

rental1.save()
rental2.save()


binding.pry
nil
