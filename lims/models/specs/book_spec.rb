require("minitest/autorun")
require_relative("../book")
require_relative("../customer")
require_relative("../rental")

class TestBook < MiniTest::Test

  def setup
    options = {"title" => "Dune", "category" => "Sci-Fi"}
    @book = Book.new(options)
    @book.save()

    @customer = Customer.new({"name" => "Jane", "postal_code" => "G1 2GF"})
    @customer.save()

    @rental = Rental.new({"book_id" => @book.id, "customer_id" => @customer.id})
    @rental.save()

  end

  def test_save()
    sql = "SELECT * FROM books WHERE id = $1"
    values = [@book.id]
    result = SqlRunner.run(sql, values)
    assert_equal(@book.id, result.first['id'].to_i)
  end

  def test_update()
    @book.title = "New Dune"
    @book.update()
    sql = "SELECT title FROM books WHERE id = $1"
    values = [@book.id]
    result = SqlRunner.run(sql, values)
    assert_equal("New Dune", result.first['title'])
  end

  def test_is_available__false()
    assert_equal(FALSE, @book.is_available())
  end

  def test_is_available__true()
    Rental.delete(@rental.id)
    assert_equal(TRUE, @book.is_available())
  end

end
