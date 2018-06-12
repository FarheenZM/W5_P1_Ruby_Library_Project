require("minitest/autorun")
require_relative("../rental")
require_relative("../customer")
require_relative("../book")

class TestRental < MiniTest::Test

    def setup
      @customer = Customer.new({"name" => "Jane", "postal_code" => "G1 2GF"})
      @customer.save()

      @book = Book.new({"title" => "Dune", "category" => "Sci-Fi"})
      @book.save()

      @rental = Rental.new({"book_id" => @book.id, "customer_id" => @customer.id})
      @rental.save()

    end

    def test_save()
      sql = "SELECT * FROM rentals WHERE id = $1"
      values = [@rental.id]
      result = SqlRunner.run(sql, values)

      assert_equal(@rental.id, result.first['id'].to_i)
    end

    def test_book()
      sql = "SELECT title FROM books WHERE id = $1"
      values = [@rental.book_id]
      result = SqlRunner.run(sql, values)

      assert_equal(result.first['title'], @rental.book.title)
    end

    def test_customer()
      sql = "SELECT name FROM customers WHERE id = $1"
      values = [@rental.customer_id]
      result = SqlRunner.run(sql, values)

      assert_equal(result.first['name'], @rental.customer.name)
    end

end
