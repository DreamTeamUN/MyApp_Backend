class AulasController < ApplicationController
  before_action :set_aula, only: [:show, :update, :destroy]

  # GET /aulas
  def index
    @aulas = Aula.all

    render json: @aulas
  end

  # GET /aulas/1
  def show
    render json: @aula
  end

  # POST /aulas
  def create
    docente_programa = DocentePrograma.find(params[:docente_programa_id])

    @aula = Aula.new(docente_id: docente_programa.docente_id, programa_id: docente_programa.programa_id)

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
      params.require(:aula).permit(:docente_id)
    end
end
