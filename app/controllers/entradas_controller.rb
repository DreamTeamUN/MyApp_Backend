class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :update, :destroy]

  # GET /entradas
  def index
    if params[:usuario_id]
      @entradas = Entrada.where(usuario_id: params[:usuario_id])
    else
      @entradas = Entrada.where(nivel_acceso_id: params[:nivel_acceso_id])
    end

    render json: @entradas
  end

  # GET /entradas/1
  def show
    render json: @entrada
  end

  # POST /entradas
  def create

    @archivo = Archivo.new()
    @archivo.nombre = "Entrada\##{Entrada.last.id + 1}"
    @archivo.extension = "html"
    @archivo.ruta = "/"

    if @archivo.save

      @entrada = Entrada.new()
      @entrada.usuario_id = params[:usuario_id]
      @entrada.entrada_id = params[:entrada_id]
      @entrada.ramificacion = Entrada.find(params[:entrada_id]).ramificacion + 1
      @entrada.nivel_acceso_id = 0
      @entrada.archivo_id = @archivo.id

      if @entrada.save
        render json: @entrada, status: :created, location: @entrada
      else
        Archivo.destroy(@archivo.id)
        render json: @entrada.errors, status: :unprocessable_entity
      end

    else
      render json: @archivo.errors, status: :unprocessable_entity
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
    Archivo.find(@entrada.archivo_id).destroy
    @entrada.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrada
      @entrada = Entrada.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entrada_params
      params.require(:entrada).permit(:publicado, :abierto, :nivel_acceso_id)
    end
end
