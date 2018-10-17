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
    @docente_programa = DocentePrograma.new(docente_programa_params)

    if @docente_programa.save
      render json: @docente_programa, status: :created, location: @docente_programa
    else
      render json: @docente_programa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /docente_programas/1
  def update
    if @docente_programa.update(docente_programa_params)
      render json: @docente_programa
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

    # Only allow a trusted parameter "white list" through.
    def docente_programa_params
      params.require(:docente_programa).permit(:docente_id, :programa_id)
    end
end
