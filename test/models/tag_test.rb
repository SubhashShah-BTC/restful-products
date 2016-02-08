require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "must not save without name" do
    tag = Tag.new
    assert_not tag.save
  end

  test "should save with name" do
    tag = Tag.new(name: "parts")
    assert tag.save
  end
end