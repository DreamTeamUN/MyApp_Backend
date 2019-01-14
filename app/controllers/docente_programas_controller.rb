class DocenteProgramasController < ApplicationController
  before_action :set_docente_programa, only: [:show, :update, :destroy]

  # GET docente_programas/:tipo/:id/:page
  def index
    case params[:tipo]
    when "1"
      @docente_programas = DocentePrograma.by_programa(params[:id], params[:page])
    when "2"
      @docente_programas = DocentePrograma.by_docente(params[:id], params[:page])
    end

    render json: @docente_programas
  end

  # GET /docente_programas/1
  def show
    render json: @docente_programa
  end

  # POST /programas/:programa_id/docentes/:docente_id/docente_programas
  def create
    repetido = DocentePrograma.repetido(params[:docente_id], params[:programa_id])
    if repetido.length > 0
      render json: repetido, status: :im_used
    else
      @docente_programa = DocentePrograma.new( docente_id: params[:docente_id], programa_id: params[:programa_id])

      if @docente_programa.save
        RegistroActividad.create(usuario_id: @docente_programa.docente.usuario_id, tipo_actividad_id: 8, ip_origen: request.remote_ip)
        render json: @docente_programa, status: :created, location: @docente_programa
      else
        render json: @docente_programa.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /docente_programas/1
  def destroy
    @docente_programa.destroy
    RegistroActividad.create(usuario_id: @docente_programa.docente.usuario_id, tipo_actividad_id: 18, ip_origen: request.remote_ip)
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docente_programa
      @docente_programa = DocentePrograma.find(params[:id])
    end

end
