class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.datetime :ano_mes_info
      t.integer :codigo_isapre
      t.string :nombre_isapre
      t.string :id_plan
      t.string :nombre_plan
      t.string :id_linea_plan
      t.datetime :ano_mes_inicio_plan
      t.string :grupo_objetivo
      t.string :sexo
      t.string :grupo_socio_eco
      t.string :comercializacion
      t.string :region
      t.string :tipo_plan
      t.string :modalidad_atencion
      t.string :amplitud_cobertura
      t.string :prestaciones_restringidas
      t.string :edad
      t.string :modalidad_precio_plan
      t.float :precio_base_plan
      t.string :codigo_tabla_factores
      t.datetime :ano_mes_ult_adecuacion
      t.string :tipo_adecuacion
      t.float :variacion_precio_base
      t.string :aplicacion_variacion
      t.float :reajuste_contractual_anual
      t.datetime :ano_mes_reajuste_contractual
      t.integer :precio_base_final
      t.string :nombre_Arancel
      t.string :modalidad_arancel
      t.integer :bonificacion_prestaciones_ambulatorias
      t.integer :bonificacion_prestaciones_hospitalarias
      t.string :copago_fijo
      t.string :modalidad_tope
      t.float :tope_anual
      t.integer :cotizantes_vigentes
      t.integer :cargas_vigentes
      t.string :cobertura_reducida
      t.string :medico_cabecera
      t.string :administrador_plan
      t.string :sistema_pago_capitado
      t.string :marca_adecuacion
      t.float :ges

      t.timestamps
    end
  end
end
