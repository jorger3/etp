class CreateFactoredad < ActiveRecord::Migration[5.0]
  def change
    create_table :factoredads do |t|
      t.string :codigo_tabla
      t.integer :grupo_edad_min
      t.integer :grupo_edad_max
      t.float :cotizante_hombre
      t.float :cotizante_mujer
      t.float :carga_hombre
      t.float :carga_mujer

      t.timestamps
    end
  end
end
