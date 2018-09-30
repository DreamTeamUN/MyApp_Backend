class NivelAccesosController < ApplicationController
  before_action :set_nivel_acceso, only: [:show, :update, :destroy]

  # GET /nivel_accesos
  def index
    @nivel_accesos = NivelAcceso.all

    render json: @nivel_accesos
  end

  # GET /nivel_accesos/1
  def show
    render json: @nivel_acceso
  end

  # POST /nivel_accesos
  def create
    @nivel_acceso = NivelAcceso.new(nivel_acceso_params)

    if @nivel_acceso.save
      render json: @nivel_acceso, status: :created, location: @nivel_acceso
    else
      render json: @nivel_acceso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nivel_accesos/1
  def update
    if @nivel_acceso.update(nivel_acceso_params)
      render json: @nivel_acceso
    else
      render json: @nivel_acceso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nivel_accesos/1
  def destroy
    @nivel_acceso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel_acceso
      @nivel_acceso = NivelAcceso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nivel_acceso_params
      params.require(:nivel_acceso).permit(:nombre)
    end
end
