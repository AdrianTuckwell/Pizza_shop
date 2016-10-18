require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/pizza'

class TestPizza < MiniTest::Test

  def setup
    options = {
      "first_name" => "Tony",
      "last_name" => "Gonclaves",
      "topping" => "Calzone",
      "quantity" => "10"
    }

    @pizza = Pizza.new(options)
  end

  def test_first_name()
    assert_equal('Tony', @pizza.first_name)
  end

  def test_last_name()
    assert_equal('Gonclaves', @pizza.last_name)
  end

  def test_full_name()
    assert_equal('Tony Gonclaves', @pizza.full_name)
  end

  def test_topping()
    assert_equal('Calzone', @pizza.topping)
  end

  def test_quantity
    assert_equal(Fixnum, @pizza.quantity.class)
    assert_equal(10, @pizza.quantity)
  end

  def test_total()
    assert_equal(100, @pizza.total())
  end

end