class PuntuacionsController < ApplicationController
  before_action :set_puntuacion, only: [:show, :update, :destroy]

  # GET /puntuacions/:tipo/:id/:page
  def index
    case params[:tipo]
    when "1"
      @puntuacions = Puntuacion.by_estudiante(params[:id], params[:page])
    when "2"
      @puntuacions = Puntuacion.by_leccion(params[:id], params[:page])
    when "3"
      @puntuacions = Puntuacion.by_tipo_juego(params[:id], params[:page])
    end

    render json: @puntuacions
  end

  # GET /puntuacions/:id
  def show
    render json: @puntuacion
  end

  # POST /estudiantes/:estudiante_id/leccions/:leccion_id/tipo_juegos/:tipo_juego_id/puntuacions
  def create
    @puntuacion = Puntuacion.new(puntuacion_params)
    @puntuacion.estudiante_id = params[:estudiante_id]
    @puntuacion.leccion_id = params[:leccion_id]
    @puntuacion.tipo_juego_id = params[:tipo_juego_id]

    if @puntuacion.save
      RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 30, ip_origen: request.remote_ip)
      render json: @puntuacion, status: :created, location: @puntuacion
    else
      render json: @puntuacion.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puntuacion
      @puntuacion = Puntuacion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def puntuacion_params
      params.require(:puntuacion).permit(:puntuacion_obtenida)
    end
end
