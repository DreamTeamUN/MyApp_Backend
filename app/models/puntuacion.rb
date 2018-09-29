class Puntuacion < ApplicationRecord

  #Relaciones
  belongs_to :estudiante
  belongs_to :tipo_juego
  belongs_to :leccion

  #Validaciones
  validates :puntuacion_obtenida, numericality: { greater_than_or_equal_to: 0 }

end
