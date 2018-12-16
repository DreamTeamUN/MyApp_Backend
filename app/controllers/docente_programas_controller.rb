class DocenteProgramasController < ApplicationController
  before_action :set_docente_programa, only: [:show, :update, :destroy]

  # GET /docente_programas
  def index
    @docente_programas = DocentePrograma.all

    render json: @docente_programas
  end

  # GET /docente_programas/1
  def show
    render json: @docente_programa
  end

  # POST /docente_programas
  def create
    @docente_programa = DocentePrograma.new( docente_id: params[:docente_id], programa_id: params[:programa_id])

    if @docente_programa.save
      render json: @docente_programa, status: :created, location: @docente_programa
    else
      render json: @docente_programa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /docente_programas/1
  def destroy
    @docente_programa.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docente_programa
      @docente_programa = DocentePrograma.find(params[:id])
    end

end
