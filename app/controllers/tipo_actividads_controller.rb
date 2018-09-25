class TipoActividadsController < ApplicationController
  before_action :set_tipo_actividad, only: [:show, :update, :destroy]

  # GET /tipo_actividads
  def index
    @tipo_actividads = TipoActividad.all

    render json: @tipo_actividads
  end

  # GET /tipo_actividads/1
  def show
    render json: @tipo_actividad
  end

  # POST /tipo_actividads
  def create
    @tipo_actividad = TipoActividad.new(tipo_actividad_params)

    if @tipo_actividad.save
      render json: @tipo_actividad, status: :created, location: @tipo_actividad
    else
      render json: @tipo_actividad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_actividads/1
  def update
    if @tipo_actividad.update(tipo_actividad_params)
      render json: @tipo_actividad
    else
      render json: @tipo_actividad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_actividads/1
  def destroy
    @tipo_actividad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_actividad
      @tipo_actividad = TipoActividad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_actividad_params
      params.require(:tipo_actividad).permit(:nombre, :descripcion)
    end
end
