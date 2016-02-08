require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "must not save without name" do
    category = Category.new
    assert_not category.save
  end

  test "should save with name" do
    category = Category.new(name: "parts")
    assert category.save
  end
end