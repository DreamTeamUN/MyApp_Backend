class TipoJuegosController < ApplicationController
  before_action :set_tipo_juego, only: [:show, :update, :destroy]

  # GET /tipo_juegos
  def index
    @tipo_juegos = TipoJuego.all

    render json: @tipo_juegos
  end

  # GET /tipo_juegos/:id
  def show
    render json: @tipo_juego
  end

  #GET juego/:tipo_juego_id/:leccion_id/:opciones/:cantidad
  def generarJuego
    frases = Leccion.find(params[:leccion_id]).frase.shuffle
    juegos = {}
    i = completados = 0
    while completados < params[:cantidad].to_i

      archivo = ArchivoJuego.getRandom(1, params[:tipo_juego_id])
      cantOpciones = [params[:opciones].to_i, frases.length].min
      opciones = frases.clone
      opciones.delete(frases[i])
      opciones.shuffle
      opciones.insert(0, frases[i])

      juegos["Juego#{completados}"] = {
        "url": archivo.archivo.ruta.url,
        "opciones": opciones[0..cantOpciones-1].shuffle,
        "correcta": frases[i].frase
      }

      i = (i+1)%frases.length
      completados += 1
    end

    render json: juegos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_juego
      @tipo_juego = TipoJuego.find(params[:id])
    end

end
