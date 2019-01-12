class EstudianteAulasController < ApplicationController
  before_action :set_estudiante_aula, only: [:show, :update, :destroy]

  # GET estudiante_aulas/:tipo/:id/:page
  def index
    case params[:tipo]
    when "1"
      @estudiante_aulas = EstudianteAula.by_estudiante(params[:id], params[:page])
    when "2"
      @estudiante_aulas = EstudianteAula.by_aula(params[:id], params[:page])
    end

    render json: @estudiante_aulas
  end

  # GET /estudiante_aulas/:id
  def show
    render json: @estudiante_aula
  end

  # POST /estudiantes/:estudiante_id/aulas/:aula_id/estudiante_aulas
  def create
    repetido = EstudianteAula.repetido(params[:estudiante_id], params[:aula_id])
    if repetido.length > 0
      render json: repetido, status: :im_used
    else
      @estudiante_aula = EstudianteAula.new(estudiante_id: params[:estudiante_id], aula_id: params[:aula_id])

      if @estudiante_aula.save
        render json: @estudiante_aula, status: :created, location: @estudiante_aula
      else
        render json: @estudiante_aula.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /estudiante_aulas/:id
  def destroy
    @estudiante_aula.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudiante_aula
      @estudiante_aula = EstudianteAula.find(params[:id])
    end

end
