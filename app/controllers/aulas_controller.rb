class AulasController < ApplicationController
  before_action :set_aula, only: [:show, :update, :destroy]

  # GET /aulas/:tipo/:id/:page
  def index
    case params[:tipo]
    when "1"
      @aulas = Aula.by_programa(params[:id], params[:page])
    when "2"
      @aulas = Aula.by_docente(params[:id], params[:page])
    end

    render json: @aulas
  end

  # GET /aulas/:id
  def show
    render json: @aula
  end

  # POST /docente_programas/:docente_programa_id/aulas
  def create
    docente_programa = DocentePrograma.find(params[:docente_programa_id])

    @aula = Aula.new(aula_params)
    @aula.docente_id = docente_programa.docente_id
    @aula.programa_id = docente_programa.programa_id

    if @aula.save
      RegistroActividad.create(usuario_id: @aula.docente.usuario_id, tipo_actividad_id: 9, ip_origen: request.remote_ip)
      render json: @aula, status: :created, location: @aula
    else
      render json: @aula.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aulas/:id
  def update
    if @aula.update(aula_params)
      RegistroActividad.create(usuario_id: @aula.docente.usuario_id, tipo_actividad_id: 17, ip_origen: request.remote_ip)
      render json: @aula
    else
      render json: @aula.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aulas/:id
  def destroy
    @aula.destroy
    RegistroActividad.create(usuario_id: @aula.docente.usuario_id, tipo_actividad_id: 12, ip_origen: request.remote_ip)
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aula
      @aula = Aula.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def aula_params
      params.require(:aula).permit(:nombre, :descripcion)
    end
end
