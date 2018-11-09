class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :update, :destroy]

  # GET /entradas
  def index
    @entradas = Entrada.by_nivel_acceso(params[:nivel_acceso_id], page_param)
    #TODO: Añadir otras formas de buscar diferentes de filtrar las entradas

    render json: @entradas
  end

  # GET /entradas/1
  def show
    render json: @entrada
  end

  # POST /entradas
  def create

    padre = Entrada.find(params[:entrada_id])

    @entrada = Entrada.new(entrada_params)
    @entrada.usuario_id = params[:usuario_id]
    @entrada.ramificacion = padre.ramificacion + 1

    if padre.abierto
      @entrada.entrada_id = params[:entrada_id]
    else
      @entrada.errors.add(:publicado, "Esta entrada no permite mas publicaciones")
    end

    if @entrada.save
      render json: @entrada, status: :created, location: @entrada
    else
      render json: @entrada.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /entradas/1
  def update
    if @entrada.update(entrada_params)
      render json: @entrada
    else
      render json: @entrada.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entradas/1
  def destroy
    @entrada.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrada
      @entrada = Entrada.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entrada_params
      params.require(:entrada).permit(:nivel_acceso_id, :texto, :abierto, :publicado)
    end

    def page_param
      params.permit(:page)
    end
end
