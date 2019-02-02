class EstudiantesController < ApplicationController
  before_action :set_estudiante, only: [:show, :update, :destroy]

  # GET /tutors/:tutor_id/estudiantes
  def index
    if params[:tutor_id].to_i == 0
      @estudiantes = Estudiante.all
    else
      @estudiantes = Tutor.find(params[:tutor_id]).estudiante
    end

    render json: @estudiantes
  end

  # GET /estudiantes/:id
  def show
    RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 7, ip_origen: request.remote_ip)
    render json: @estudiante
  end

  # POST /tutors/:tutor_id/estudiantes
  def create
    @estudiante = Estudiante.new(estudiante_params)

    @estudiante.tutor_id = params[:tutor_id]

    #TODO: verificar que el archivo sea una imagen

    if @estudiante.save
      RegistroActividad.create(usuario_id: @estudiante.tutor.usuario_id, tipo_actividad_id: 21, ip_origen: request.remote_ip)
      render json: @estudiante, status: :created, location: @estudiante
    else
      render json: @estudiante.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estudiantes/:id
  def update
    if @estudiante.update(estudiante_params)
      render json: @estudiante
    else
      render json: @estudiante.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estudiantes/:id
  def destroy
    @estudiante.destroy
    RegistroActividad.create(usuario_id: @estudiante.tutor.usuario_id, tipo_actividad_id: 11, ip_origen: request.remote_ip)
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudiante
      @estudiante = Estudiante.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estudiante_params
      params.require(:estudiante).permit(:nombre, :fecha_nacimiento, :archivo_id)
    end
end
