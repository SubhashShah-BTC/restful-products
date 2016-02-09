class Api::V1::ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    parser = ParameterParser.new(params)
    parser.parse
    product_creator_service = ProductCreatorService.new(parser.product_params, parser.var_params)
    if product_creator_service.create_product
      render json: { message: "Product created successfully." }, status: 200
    else
      render json: { message: product_creator_service.errors }, status: 422
    end
  end

  private

  def product_params
    params.permit(:name, :description, :expire_date, :price, :collection_id, :SKU_ID, category_ids: [], tag_ids: [])
  end

  def var_params
    params.require(:vars).permit(:color) if params[:vars].present?
  end
end
