class TipoJuego < ApplicationRecord
  has_many :archivo_juego
  has_many :puntuacion
end
