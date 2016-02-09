class Api::V1::ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_action :process_params, only: [:create]

  def create
    Product.transaction do
      product = Product.new(product_params)
      product.tags = @tags if params[:tags].present?
      product.categories = @categories if params[:categories].present?
      product.var = @vars  if params[:vars].present?
      product.images = @images  if params[:images].present?
      product.price /= 100 if product.price.present? && product.price > 0
      if product.save
        render json: "Product saved successfully", status: 200
      else
        render json: product.errors.full_messages, status: 422
      end
    end
  end

  private

  def product_params
    params.permit(:name, :description, :expire_date, :price, :collection_id, :SKU_ID)
  end

  def var_params
    params.require(:vars).permit(:color) if params[:vars].present?
  end

  def process_params
    find_or_create_tags
    find_or_create_categories
    create_vars
    create_images
  end

  def find_or_create_tags
    @tags = params[:tags].inject([]) { |tags, tag_name| tags << Tag.find_or_initialize_by(name: tag_name) } if params[:tags].present?
  end

  def find_or_create_categories
    @categories = params[:categories].inject([]) { |categories, category_name| categories << Category.find_or_initialize_by(name: category_name) } if params[:categories].present?
  end

  def create_vars
    return if params[:vars].blank?
    models = params[:vars][:models].inject([]) { |models, model_name| models << Model.find_or_initialize_by(name: model_name) } if params[:vars].present? && params[:vars][:models].present?
    @vars = Var.create(var_params)
    @vars.models = models
  end

  def create_images
    @images = params[:images].inject([]) { |images, image_hash| images << Image.new(img: URI.parse(image_hash[:img_path]) )} if params[:images].present?
  end
end
