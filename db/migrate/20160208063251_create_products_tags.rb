class CreateProductsTags < ActiveRecord::Migration
  def change
    create_table :products_tags do |t|
      t.references :product, null: false
      t.references :tag, null: false
    end
  end
end
