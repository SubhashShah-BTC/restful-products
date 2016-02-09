require 'test_helper'

class ParameterParserTest < ActiveSupport::TestCase

  test "initializes with json request params" do
    assert ParameterParser.new({})
  end

  test "can call parse method to parse parameters" do
    param_parser = ParameterParser.new(dummy_request_params)
    param_parser.parse
    product_params = param_parser.product_params
    var_params = param_parser.var_params
    assert_kind_of String, product_params[:name]
    assert_kind_of String, product_params[:description]
    assert_kind_of String, product_params[:SKU_ID]
    assert_kind_of Integer, product_params[:collection_id]
    assert_kind_of Array, product_params[:category_ids]
    assert_kind_of Array, product_params[:tag_ids]
    assert_kind_of Array, var_params[:model_ids]
  end


  def dummy_request_params
    {"expire_date":"2016-09-08","name":"Anotherrr pipe","collection_id":314,"SKU_ID":"SKU_12122121","categories":["parts","exhaust"],"tags":["porsche","parts","exhaust","new_part"],"vars":{"color":"black","models":["914","924","928"]},"images":[{"img_path":"https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Ruby_on_Rails.svg/791px-Ruby_on_Rails.svg.png"}],"price":99500,"description":"short description of an item"}
  end
end