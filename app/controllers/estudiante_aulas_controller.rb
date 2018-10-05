class EstudianteAulasController < ApplicationController
  before_action :set_estudiante_aula, only: [:show, :update, :destroy]

  # GET /estudiante_aulas
  def index
    @estudiante_aulas = EstudianteAula.all

    render json: @estudiante_aulas
  end

  # GET /estudiante_aulas/1
  def show
    render json: @estudiante_aula
  end

  # POST /estudiante_aulas
  def create
    @estudiante_aula = EstudianteAula.new(estudiante_aula_params)

    if @estudiante_aula.save
      render json: @estudiante_aula, status: :created, location: @estudiante_aula
    else
      render json: @estudiante_aula.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estudiante_aulas/1
  def update
    if @estudiante_aula.update(estudiante_aula_params)
      render json: @estudiante_aula
    else
      render json: @estudiante_aula.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estudiante_aulas/1
  def destroy
    @estudiante_aula.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudiante_aula
      @estudiante_aula = EstudianteAula.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estudiante_aula_params
      params.require(:estudiante_aula).permit(:aula_id, :estudiante_id)
    end
end
