class TipoJuego < ApplicationRecord
  has_many :archivo_juego
  has_many :archivo, through: :archivo_juego
  has_many :puntuacion
end
