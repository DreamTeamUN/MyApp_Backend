class EstudiantesController < ApplicationController
  before_action :set_estudiante, only: [:show, :update, :destroy]

  # GET /tutors/:tutor_id/estudiantes
  def index
    if params[:tutor_id].to_i < 1
      @estudiantes = Estudiante.all
    else
      @estudiantes = Tutor.find(params[:tutor_id]).estudiante
    end

    render json: @estudiantes
  end

  # GET /estudiantes/1
  def show
    render json: @estudiante
  end

  # POST /estudiantes
  def create
    @estudiante = Estudiante.new(estudiante_params)

    @estudiante.tutor_id = params[:tutor_id]

    #TODO: verificar que el archivo sea una imagen

    if @estudiante.save
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

  # DELETE /estudiantes/1
  def destroy
    @estudiante.destroy
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
