class FrasesController < ApplicationController
  before_action :set_frase, only: [:show, :update, :destroy]

  # GET /frases
  def index
    @frases = Frase.by_leccion(params[:leccion_id])

    render json: @frases
  end

  # GET /frases/1
  def show
    render json: @frase
  end

  # POST /frases
  def create
    @frase = Frase.new(frase_params)

    if @frase.save
      RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 22, ip_origen: request.remote_ip)
      render json: @frase, status: :created, location: @frase
    else
      render json: @frase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frases/1
  def update
    if @frase.update(frase_params)
      render json: @frase
    else
      render json: @frase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frases/1
  def destroy
    RegistroActividad.create(usuario_id: 0, tipo_actividad_id: 23, ip_origen: request.remote_ip)
    @frase.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frase
      @frase = Frase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def frase_params
      params.require(:frase).permit(:frase, :leccion_id)
    end
end
