class ProductsController < ApplicationController

  before_action :update_categories_tags, only: [:update]
  before_action :populate_data, only: [:edit, :update]

  def index
    @products = Product.includes(:categories, :tags, :images, var: :models).all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.var = Var.new(var_params)
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated successfully."
      redirect_to products_path
    else
      flash.now[:danger] = @product.errors.full_messages.join("\n")
      render "edit"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :collection_id, :SKU_ID, :price, :expire_date, category_ids: [], tag_ids: [])
  end

  def var_params
    params[:product].require(:var).permit(:color, model_ids: [])
  end

  def update_categories_tags
    params[:product][:category_ids] ||= []
    params[:product][:tag_ids] ||= []
    params[:product][:var][:model_ids] ||= []
  end

  def populate_data
    @tags = Tag.all
    @categories = Category.all
    @colors = Var.colors
    @models = Model.all
  end
end
