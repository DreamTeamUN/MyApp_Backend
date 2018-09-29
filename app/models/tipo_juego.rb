class TipoJuego < ApplicationRecord

  #Relaciones
  has_many :archivo_juego
  has_many :archivo, through: :archivo_juego
  has_many :puntuacion

  #Validaciones
  validates :nombre, length: { minimum: 3, maximum: 45 }
  validates :descripcion, length: { maximum: 100 }

end
