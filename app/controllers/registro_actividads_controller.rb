class RegistroActividadsController < ApplicationController
  before_action :set_registro_actividad, only: [:show, :update, :destroy]

  # GET /registro_actividads
  def index
    @registro_actividads = RegistroActividad.all

    render json: request.remote_ip
  end

  # GET /registro_actividads/1
  def show
    render json: @registro_actividad
  end

  # POST /registro_actividads
  def create
    @registro_actividad = RegistroActividad.new(registro_actividad_params)

    if @registro_actividad.save
      render json: @registro_actividad, status: :created, location: @registro_actividad
    else
      render json: @registro_actividad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registro_actividads/1
  def update
    if @registro_actividad.update(registro_actividad_params)
      render json: @registro_actividad
    else
      render json: @registro_actividad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registro_actividads/1
  def destroy
    @registro_actividad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro_actividad
      @registro_actividad = RegistroActividad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registro_actividad_params
      params.require(:registro_actividad).permit(:usuario_id, :tipo_actividad_id)
    end
end
