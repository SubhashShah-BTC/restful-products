class CreateVars < ActiveRecord::Migration
  def change
    create_table :vars do |t|
      t.integer :color
      t.references :product

      t.timestamps null: false
    end
  end
end
