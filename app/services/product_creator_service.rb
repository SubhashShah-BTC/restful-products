class ProductCreatorService

  attr_reader :errors

  def initialize(product_json, var_json)
    @product_json = product_json
    @var_json = var_json
    @errors = []
  end

  def create_product
    product = Product.new(@product_json)
    product.transaction do
      begin
        product.save!
        Var.create(@var_json.merge({product_id: product.id}))
        return true
      rescue ActiveRecord::RecordInvalid => e
        @errors = product.errors.full_messages
        return false
      end
    end
  end
end