class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :update, :destroy]

  # GET /entradas
  def index
    @entradas = Entrada.all

    render json: @entradas
  end

  # GET /entradas/1
  def show
    render json: @entrada
  end

  # POST /entradas
  def create
    @entrada = Entrada.new(entrada_params)

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
      params.require(:entrada).permit(:publicado, :abierto, :ramificacion, :archivo_id, :entrada_id, :nivel_acceso_id, :usuario_id)
    end
end
