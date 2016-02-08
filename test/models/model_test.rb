require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  test "must not save without name" do
    model = Model.new
    assert_not model.save
  end

  test "should save with name" do
    model = Model.new(name: "322")
    assert model.save
  end

  test "must return valid json" do
    model = models(:model_111)
    assert_equal {name: "111"}, model.to_json
  end
end