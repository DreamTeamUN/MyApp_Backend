class NivelAccesosController < ApplicationController
  before_action :set_nivel_acceso, only: [:show, :update, :destroy]

  # GET /nivel_accesos
  def index
    @nivel_accesos = NivelAcceso.all

    render json: @nivel_accesos
  end

  # GET /nivel_accesos/:id
  def show
    render json: @nivel_acceso
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel_acceso
      @nivel_acceso = NivelAcceso.find(params[:id])
    end
end
