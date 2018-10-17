# == Schema Information
#
# Table name: puntuacions
#
#  id                  :integer          not null, primary key
#  puntuacion_obtenida :integer          default(0), not null
#  tipo_juego_id       :integer          not null
#  estudiante_id       :integer          not null
#  leccion_id          :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Puntuacion < ApplicationRecord

  #Relaciones
  belongs_to :estudiante
  belongs_to :tipo_juego
  belongs_to :leccion

  #Validaciones
  validates :puntuacion_obtenida, numericality: { greater_than_or_equal_to: 0 }

end
