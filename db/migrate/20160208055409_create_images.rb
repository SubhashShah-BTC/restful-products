class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :img
      t.references :product

      t.timestamps null: false
    end
  end
end
