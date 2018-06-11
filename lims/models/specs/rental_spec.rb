require("minitest/autorun")
require_relative("../rental")

class TestRental < MiniTest::Test

  def setup
    options = {"id" => 1 }
    @rental = Rental.new(options)
  end

  def test_save()

  end

end
