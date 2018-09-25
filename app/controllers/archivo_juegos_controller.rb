class ArchivoJuegosController < ApplicationController
  before_action :set_archivo_juego, only: [:show, :update, :destroy]

  # GET /archivo_juegos
  def index
    @archivo_juegos = ArchivoJuego.all

    render json: @archivo_juegos
  end

  # GET /archivo_juegos/1
  def show
    render json: @archivo_juego
  end

  # POST /archivo_juegos
  def create
    @archivo_juego = ArchivoJuego.new(archivo_juego_params)

    if @archivo_juego.save
      render json: @archivo_juego, status: :created, location: @archivo_juego
    else
      render json: @archivo_juego.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /archivo_juegos/1
  def update
    if @archivo_juego.update(archivo_juego_params)
      render json: @archivo_juego
    else
      render json: @archivo_juego.errors, status: :unprocessable_entity
    end
  end

  # DELETE /archivo_juegos/1
  def destroy
    @archivo_juego.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archivo_juego
      @archivo_juego = ArchivoJuego.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def archivo_juego_params
      params.fetch(:archivo_juego, {})
    end
end
