class Puntuacion < ApplicationRecord

  belongs_to :estudiante
  belongs_to :tipo_juego
  belongs_to :leccion
end
