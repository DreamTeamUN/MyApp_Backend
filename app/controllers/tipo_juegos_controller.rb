class TipoJuegosController < ApplicationController
  before_action :set_tipo_juego, only: [:show, :update, :destroy]

  # GET /tipo_juegos
  def index
    @tipo_juegos = TipoJuego.all

    render json: @tipo_juegos
  end

  # GET /tipo_juegos/1
  def show
    render json: @tipo_juego
  end

  # POST /tipo_juegos
  def create
    @tipo_juego = TipoJuego.new(tipo_juego_params)

    if @tipo_juego.save
      render json: @tipo_juego, status: :created, location: @tipo_juego
    else
      render json: @tipo_juego.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_juegos/1
  def update
    if @tipo_juego.update(tipo_juego_params)
      render json: @tipo_juego
    else
      render json: @tipo_juego.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_juegos/1
  def destroy
    @tipo_juego.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_juego
      @tipo_juego = TipoJuego.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_juego_params
      params.require(:tipo_juego).permit(:nombre_juego, :descripcion)
    end
end
