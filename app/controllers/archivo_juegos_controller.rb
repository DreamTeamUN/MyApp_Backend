class ArchivoJuegosController < ApplicationController
  before_action :set_archivo_juego, only: [:show, :update, :destroy]

  # GET /archivo_juegos/:id
  def show
    render json: @archivo_juego
  end

  # POST /tipo_juego/:tipo_juego_id/frase/:frase_id/archivo/:archivo_id/archivo_juegos
  def create
    @archivo_juego = ArchivoJuego.new(
      tipo_juego_id: params[:tipo_juego_id], frase_id: params[:frase_id], archivo_id: params[:archivo_id])

    if @archivo_juego.save
      render json: @archivo_juego, status: :created, location: @archivo_juego
    else
      render json: @archivo_juego.errors, status: :unprocessable_entity
    end
  end

  # DELETE /archivo_juegos/:id
  def destroy
    @archivo_juego.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archivo_juego
      @archivo_juego = ArchivoJuego.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def archivo_juego_params
      params.require(:archivo_juego).permit()
    end
end
