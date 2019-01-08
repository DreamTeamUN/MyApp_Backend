class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :update, :destroy]

  # GET /entradas
  def index

    case params[:tipo]
    when "1"
      @entradas = Entrada.by_nivel_acceso(params[:id], params[:page])
    when "2"
      @entradas = Entrada.by_usuario(params[:id], params[:page])
    when "3"
      @entradas = Entrada.by_entrada(params[:id], params[:page])
    end

    render json: @entradas
  end

  # GET /entradas/:id
  def show
    render json: @entrada
  end

  # POST /usuarios/:usuario_id/entradas/:entrada_id/entradas
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

  # PATCH/PUT /entradas/:id
  def update
    if @entrada.update(entrada_patch)
      render json: @entrada
    else
      render json: @entrada.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entradas/1
  def destroy
    @entrada.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrada
      @entrada = Entrada.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entrada_params
      params.require(:entrada).permit(:nivel_acceso_id, :titulo, :resumen, :texto, :abierto, :publicado)
    end

    def entrada_patch
      params.require(:entrada).permit(:nivel_acceso_id, :resumen, :texto, :abierto, :publicado)
    end
end
