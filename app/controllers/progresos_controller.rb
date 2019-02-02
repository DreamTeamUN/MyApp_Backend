class ProgresosController < ApplicationController
  before_action :set_progreso, only: [:show, :update, :destroy]

  # GET /progresos
  def index
    @progresos = Progreso.all

    render json: @progresos
  end

  # GET /progresos/1
  def show
    render json: @progreso
  end

  # POST /progresos
  def create
    @progreso = Progreso.new(progreso_params)

    if @progreso.save
      #RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 22, ip_origen: request.remote_ip)
      render json: @progreso, status: :created, location: @progreso
    else
      render json: @progreso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /progresos/1
  def update
    if @progreso.update(progreso_params)
      render json: @progreso
    else
      render json: @progreso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /progresos/1
  def destroy
    @progreso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progreso
      @progreso = Progreso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def progreso_params
      params.require(:progreso).permit(:repeticion_completada, :estudiante_id, :leccion_id)
    end
end
