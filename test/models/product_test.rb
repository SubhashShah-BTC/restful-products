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

  test "should save categories" do
    product = Product.new(name: "Tap")
    product.categories << Category.new(name: "taps")
    product.categories << Category.new(name: "hardware")
    assert product.save
    assert_equal product.categories.count, 2
  end

  test "should save tags" do
    product = Product.new(name: "Tap")
    product.tags << Tag.new(name: "taps")
    product.tags << Tag.new(name: "hardware")
    assert product.save
    assert_equal product.tags.count, 2
  end

  test "should save var" do
    product = Product.new(name: "Tap")
    var = Var.create(color: "blue")
    var.models << Model.new(name: "124")
    var.models << Model.new(name: "222")
    var.models << Model.new(name: "333")
    product.var = var
    assert product.save
  end

  test "should save images" do
    product = Product.new(name: "Tap")
    product.images << Image.new
    assert product.save
  end
end