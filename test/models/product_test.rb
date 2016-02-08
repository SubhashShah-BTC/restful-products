require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "must not save without name" do
    product = Product.new
    assert_not product.save
  end

  test "should save with name" do
    product = Product.new(name: "Exhaust pipe")
    assert product.save
  end
end