require("minitest/autorun")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => ""}
    @customer = Customer.new(options)
  end

  def test_save()

  end

end
