class FrasesController < ApplicationController
  before_action :set_frase, only: [:show, :update, :destroy]

  # GET /leccions/:leccion_id/frases
  def index
    if params[:leccion_id].to_i == 0
      @frases = Frase.all
    else
      @frases = Frase.by_leccion(params[:leccion_id])
    end
    render json: @frases
  end

  # GET /frases/:id
  def show
    render json: @frase
  end

  # POST /leccions/:leccion_id/frases
  def create
    @frase = Frase.new(frase_params)
    @frase.leccion_id = params[:leccion_id]

    if @frase.save
      RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 22, ip_origen: request.remote_ip)
      render json: @frase, status: :created, location: @frase
    else
      render json: @frase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frases/:id
  def destroy
    RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 23, ip_origen: request.remote_ip)
    @frase.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frase
      @frase = Frase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def frase_params
      params.require(:frase).permit(:frase)
    end
end
