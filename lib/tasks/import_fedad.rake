task :import_fedad => :environment do
  require 'csv'
  filename = File.read('app/tabla_factor_edad.csv').force_encoding('UTF-8')
  csv = CSV.parse(filename, :headers => true) do |row|
    hash = {
      codigo_tabla: row[0],
      grupo_edad_min: row[1],
      grupo_edad_max: row[2],
      cotizante_hombre: row[3],
      cotizante_mujer: row[4],
      carga_hombre: row[5],
      carga_mujer: row[6]

    }
    Factoredad.create!(hash)
  end
end
