require("minitest/autorun")
require_relative("../book")

class TestBook < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "Dune", "category" => "Sci-Fi",
      "available" => "Yes"}
    @book = Book.new(options)
  end

  def test_save()
    result = @book.save()
    assert_equal("Dune", result[0][:title])
  end

end
