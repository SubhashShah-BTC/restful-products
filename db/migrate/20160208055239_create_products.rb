class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.date :expire_date
      t.integer :collection_id
      t.string :SKU_ID
      t.integer :price
      t.string :description

      t.timestamps null: false
    end
  end
end
