class ParameterParser

  attr_accessor :params
  attr_reader :product_params
  attr_reader :var_params

  def initialize(json_params)
    @params = json_params
    @product_params = {}
    @var_params = {}
  end

  def parse
    parse_product_params
    process_tag_params
    process_category_params
    process_image_params
    process_var_params
  end

  private

  def parse_product_params
    @params.each do |key, value|
      @product_params[key] = value if Product.column_names.include?(key.to_s)
    end
  end

  def process_tag_params
    @product_params[:tag_ids] = @params[:tags].compact.inject([]) { |tag_ids, tag| tag_ids << Tag.find_or_create_by(name: tag).id } if @params[:tags].present?
  end

  def process_category_params
    @product_params[:category_ids] = @params[:categories].compact.inject([]) { |category_ids, category| category_ids << Category.find_or_create_by(name: category).id } if @params[:categories].present?
  end

  def process_image_params
    @product_params[:image_ids] = @params[:images].compact.inject([]) { |image_ids, image_hash| image_ids << Image.create(img: URI.parse(image_hash[:img_path])).id } if @params[:images].present?
  end

  def process_var_params
    return unless @params[:vars].present?
    @var_params[:color] = @params[:vars][:color]
    @var_params[:model_ids] = model_ids
  end

  def model_ids
    return [] unless @params[:vars][:models].present?
    @params[:vars][:models].compact.inject([]) { |model_ids, model| model_ids << Model.find_or_create_by(name: model).id }
  end
end