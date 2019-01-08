class LeccionsController < ApplicationController
  before_action :set_leccion, only: [:show, :update, :destroy]

  # GET /programas/:programa_id/leccions
  def index
    if params[:programa_id].to_i == 0
      @leccions = Leccion.all
    else
      @leccions = Leccion.by_programa(params[:programa_id])
    end

    render json: @leccions
  end

  # GET /leccions/:id
  def show
    render json: @leccion
  end

  # POST /programas/:programa_id/leccions
  def create
    @leccion = Leccion.new(leccion_params)
    @leccion.programa_id = params[:programa_id]

    if @leccion.save
      render json: @leccion, status: :created, location: @leccion
    else
      render json: @leccion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leccions/:id
  def update
    if @leccion.update(leccion_params)
      render json: @leccion
    else
      render json: @leccion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leccions/:id
  def destroy
    @leccion.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leccion
      @leccion = Leccion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def leccion_params
      params.require(:leccion).permit(:semana)
    end
end
