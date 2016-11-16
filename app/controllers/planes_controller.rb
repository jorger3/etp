class PlanesController < ApplicationController
  def new
  end
  def home
  end
  def search
    @plan = Plan.all
    if params[:search]
      @plan = Plan.search(params[:search])
    else
      @plan = Post.all
    end
  end
  def show
    #@plan0 = Plan.select().where()
    @uf = 26000
    @sexo = params[:sex]
    @edad = params[:age]
    @carga = params[:carga]
    @rentaB = params[:rentaB]
    @renta_min = params[:rentaB].to_i*0.04/@uf
    @renta_max = params[:rentaB].to_i*0.1/@uf
    @region = params[:region].to_i
    @tablafactor2 = Factoredad.select('cotizante_hombre').where("grupo_edad_min <= ? AND grupo_edad_max > ?", @edad, @edad)
    @tablafactor = Factoredad.select('codigo_tabla, cotizante_hombre, cotizante_mujer, carga_hombre, carga_mujer').where("grupo_edad_min <= ? AND grupo_edad_max > ?", @edad, @edad)
    if @sexo == 'Hombre'
      @tablafactor.each do |tabla|
        @plan = Plan.where("((precio_base_final * ?)+ ges) < ? AND ((precio_base_final * ?)+ ges) > ? AND sexo= ? AND comercializacion= ? AND region LIKE '%?%'", tabla.cotizante_hombre, @renta_max, tabla.cotizante_hombre, @renta_min, @sexo, 'Si Comer.', @region).references(:factoredads)
      end
    elsif @sexo == 'Mujer'
        @tablafactor.each do |tabla|
          @plan = Plan.where("((precio_base_final * ?)+ ges) < ? AND ((precio_base_final * ?)+ ges) > ? AND sexo= ? AND comercializacion= ? AND region LIKE '%?%'", tabla.cotizante_mujer, @renta_max, tabla.cotizante_mujer, @renta_min, @sexo, 'Si Comer.', @region).references(:factoredads)
        end
    else
        @tablafactor.each do |tabla|
          @plan = Plan.where("((precio_base_final * ?)+ ges) < ? AND ((precio_base_final * ?)+ ges) > ? AND sexo!= ? AND comercializacion= ? AND region LIKE '%?%'", tabla.cotizante_hombre, @renta_max, tabla.cotizante_hombre, @renta_min, 'Mujer', 'Si Comer.', @region).references(:factoredads)
          @plan = Plan.where("((precio_base_final * ?)+ ges) < ? AND ((precio_base_final * ?)+ ges) > ? AND sexo!= ? AND comercializacion= ? AND region LIKE '%?%'", tabla.cotizante_mujer, @renta_max, tabla.cotizante_mujer, @renta_min, 'Hombre', 'Si Comer.', @region).references(:factoredads)
        end
    end



    #@plan = Plan.where("sexo= ? AND comercializacion= ? AND region LIKE '%?%'", @sexo, 'Si Comer.', @region)
    #Factoredad.select('codigo_tabla').where("grupo_edad_min <= ? AND grupo_edad_max > ?", @edad, @edad).first
    #@plan = Plan.joins(:factoredads).where("((precio_base_final * factoredads.cotizante_hombre)+ ges)*? < ? AND ((precio_base_final * factoredads.cotizante_hombre)+ ges)*? > ? AND sexo= ? AND comercializacion= ? AND region LIKE '%?%'", @uf, @renta_max, @uf, @renta_min, @sexo, 'Si Comer.', @region).references(:factoredads)

    #@plan = Plan.where("((precio_base_final * ?)+ ges)*? < ? AND ((precio_base_final * ?)+ ges)*? > ? AND sexo= ? AND comercializacion= ? AND region LIKE '%?%'", @coti,  @uf, @renta_max, @coti, @uf, @renta_min, @sexo, 'Si Comer.', @region)
    #@plan = Plan.where("codigo_isapre = ? AND comercializacion= ?", 99, 'Si Comer.')
    #@plan = Plan.where("sexo = ? AND comercializacion= ?", 'Ambos', 'Si Comer.')
    #@plan = Plan.where("region LIKE ?", '%-15%')

  end
end
