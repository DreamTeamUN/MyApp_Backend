class ArchivosController < ApplicationController
  before_action :set_archivo, only: [:show, :update, :destroy]

  # GET /archivos/:tipo/:id/:page
  def index
    case params[:tipo]
    when "1"
      @archivos = Archivo.by_tipo_archivo(params[:id], params[:page])
    when "2"
      @archivos = ArchivoJuego.by_frase(params[:id], params[:page])
    when "3"
      @archivos = ArchivoJuego.by_tipo_juego(params[:id], params[:page])
    end

    render json: @archivos
  end

  # GET /archivos/1
  def show
    render json: @archivo
  end

  # POST /archivos
  def create
    @archivo = Archivo.new(archivo_params)

    partes = @archivo.ruta.to_s.split("/").last.split(".")
    @archivo.nombre = partes[0]
    @archivo.extension = partes[1]

    case partes[1]
    when "png", "jpg", "jpeg"
      @archivo.tipo_archivo = "imagen"
    when "pdf"
      @archivo.tipo_archivo = "pdf"
    when "mp3"
      @archivo.tipo_archivo = "audio"
    end


    if @archivo.save
      render json: @archivo, status: :created, location: @archivo
    else
      render json: @archivo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /archivos/1
  def destroy
    @archivo.destroy
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archivo
      @archivo = Archivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def archivo_params
      params.permit(:ruta)
    end
end
