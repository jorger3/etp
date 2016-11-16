class AddPlanRefToFactoredad < ActiveRecord::Migration[5.0]
  def change
    add_reference :factoredads, :plan, foreign_key: true
  end
end
