class AddFactorToPlans < ActiveRecord::Migration[5.0]
  def change
    add_index :plans, :codigo_tabla_factores
  end
end
