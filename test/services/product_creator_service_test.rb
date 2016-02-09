require 'test_helper'

class ProductCreatorTest < ActiveSupport::TestCase

  test "must be instatiable" do
    product_creator_service = ProductCreatorService.new({}, {})
    assert_not product_creator_service.create_product
  end
end