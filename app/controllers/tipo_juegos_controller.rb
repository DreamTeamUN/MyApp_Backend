class TipoJuegosController < ApplicationController
  before_action :set_tipo_juego, only: [:show, :update, :destroy]

  # GET /tipo_juegos
  def index
    @tipo_juegos = TipoJuego.all

    render json: @tipo_juegos
  end

  # GET /tipo_juegos/:id
  def show
    render json: @tipo_juego
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_juego
      @tipo_juego = TipoJuego.find(params[:id])
    end

end
