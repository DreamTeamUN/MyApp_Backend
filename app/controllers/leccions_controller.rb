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
    repetido = Leccion.repetido(params[:programa_id], params[:leccion][:semana])
    if repetido.length > 0
      render json: repetido, status: :im_used
    else
      @leccion = Leccion.new(leccion_params)
      @leccion.programa_id = params[:programa_id]

      if @leccion.save
        RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 24, ip_origen: request.remote_ip)
        render json: @leccion, status: :created, location: @leccion
      else
        render json: @leccion.errors, status: :unprocessable_entity
      end
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
    RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 25, ip_origen: request.remote_ip)
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
