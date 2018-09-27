class ArchivoJuego < ApplicationRecord
  belongs_to :tipo_juego
  belongs_to :frase
  belongs_to :archivo
end
