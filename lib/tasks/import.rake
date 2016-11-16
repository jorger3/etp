task :import => :environment do
  require 'csv'
  filename = File.read('app/2016093.csv').force_encoding('UTF-8')
  csv = CSV.parse(filename, :headers => false) do |row|
    hash = {
      ano_mes_info: row[0],
      codigo_isapre: row[1],
      nombre_isapre: row[2],
      id_plan: row[3],
      nombre_plan: row[4],
      id_linea_plan: row[5],
      ano_mes_inicio_plan: row[6],
      grupo_objetivo: row[7],
      sexo: row[8],
      grupo_socio_eco: row[9],
      comercializacion: row[10],
      region: row[11],
      tipo_plan: row[12],
      modalidad_atencion: row[13],
      amplitud_cobertura: row[14],
      prestaciones_restringidas: row[15],
      edad: row[16],
      modalidad_precio_plan: row[17],
      precio_base_plan: row[18],
      codigo_tabla_factores: row[19],
      ano_mes_ult_adecuacion: row[20],
      tipo_adecuacion: row[21],
      variacion_precio_base: row[22],
      aplicacion_variacion: row[23],
      reajuste_contractual_anual: row[24],
      ano_mes_reajuste_contractual: row[25],
      precio_base_final: row[26],
      nombre_Arancel: row[27],
      modalidad_arancel: row[28],
      bonificacion_prestaciones_ambulatorias: row[29],
      bonificacion_prestaciones_hospitalarias: row[30],
      copago_fijo: row[31],
      modalidad_tope: row[32],
      tope_anual: row[33],
      cotizantes_vigentes: row[34],
      cargas_vigentes: row[35],
      cobertura_reducida: row[36],
      medico_cabecera: row[37],
      administrador_plan: row[38],
      sistema_pago_capitado: row[39],
      marca_adecuacion: row[40],
      ges: row[41]

    }
    Plan.create!(hash)
  end
end
