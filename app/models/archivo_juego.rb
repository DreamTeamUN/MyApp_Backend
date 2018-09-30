class ArchivoJuego < ApplicationRecord

  #Relaciones
  belongs_to :tipo_juego
  belongs_to :archivo
  belongs_to :frase

  #Validaciones

end
