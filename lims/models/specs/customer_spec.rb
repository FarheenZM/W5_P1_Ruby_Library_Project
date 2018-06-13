require("minitest/autorun")
require_relative("../customer")
require_relative("../book")
require_relative("../rental")

class TestCustomer < MiniTest::Test

  def setup
    @customer = Customer.new({"name" => "Jane", "address" => "Street A, G1 2GF"})
    @customer.save()

    @book = Book.new({"title" => "Dune", "category" => "Sci-Fi"})
    @book.save()

    @rental = Rental.new({"book_id" => @book.id, "customer_id" => @customer.id})
    @rental.save()

  end

  def test_save()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer.id]
    result = SqlRunner.run(sql, values)
    assert_equal(@customer.id, result.first['id'].to_i)
  end

  def test_update()
    @customer.address = "Street A, G1 1GS"
    @customer.update()
    sql = "SELECT address FROM customers WHERE id = $1"
    values = [@customer.id]
    result = SqlRunner.run(sql, values)
    assert_equal("Street A, G1 1GS", result.first['address'])
  end

  def test_rented_book_count()
    sql = "SELECT COUNT(*) FROM rentals WHERE customer_id = $1"
    values = [@customer.id]
    count = SqlRunner.run(sql, values)
    assert_equal(count.first['count'].to_i, @customer.rented_book_count())
  end

end
