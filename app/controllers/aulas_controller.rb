class AulasController < ApplicationController
  before_action :set_aula, only: [:show, :update, :destroy]

  # GET /aulas
  def index
    case params[:tipo]
    when "1"
      @aulas = Aula.by_programa(params[:id], params[:page])
    when "2"
      @aulas = Aula.by_docente(params[:id], params[:page])
    end

    render json: @aulas
  end

  # GET /aulas/1
  def show
    render json: @aula
  end

  # POST /aulas
  def create
    docente_programa = DocentePrograma.find(params[:docente_programa_id])

    @aula = Aula.new(aula_params)
    @aula.docente_id = docente_programa.docente_id
    @aula.programa_id = docente_programa.programa_id

    if @aula.save
      render json: @aula, status: :created, location: @aula
    else
      render json: @aula.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aulas/1
  def update
    if @aula.update(aula_params)
      render json: @aula
    else
      render json: @aula.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aulas/1
  def destroy
    @aula.destroy
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
