class CreateModelsVars < ActiveRecord::Migration
  def change
    create_table :models_vars do |t|
      t.references :model, null: false
      t.references :var, null: false
    end
  end
end
