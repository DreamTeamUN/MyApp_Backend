class ArchivoJuego < ApplicationRecord
  belongs_to :tipo_juego
  belongs_to :archivo
  belongs_to :frase
end
