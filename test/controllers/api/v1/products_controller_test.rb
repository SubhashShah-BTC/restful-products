require 'test_helper'

class Api::V1::ProductsControllerTest < ActionController::TestCase
  test "should respond with success for valid request" do
    post :create, {name: "My Product", description: "short test description", categories: ["cat1"]}

    assert_response :success
  end

  test "should create categories and tags for valid request" do
    post :create, {name: "My Product", description: "short test description", categories: ["cat1"], tags: ["tag1", "tag2"]}

    assert_response :success
    assert_equal Category.count, 4 # 3 categories in fixtures
    assert_equal Tag.count, 4 # 2 tags in fixtures
  end

  test "should respond with unprocessable entity response if name is missing" do
    post :create, {name: "", description: "short test description", categories: ["cat1"]}

    assert_response :unprocessable_entity
  end

  test "should respond with unprocessable entity response if category name is missing" do
    post :create, {name: "", description: "short test description", categories: [""]}

    assert_response :unprocessable_entity
  end

  test "should respond with unprocessable entity response if tag name is missing" do
    post :create, {name: "", description: "short test description", tags: [""]}

    assert_response :unprocessable_entity
  end
end
