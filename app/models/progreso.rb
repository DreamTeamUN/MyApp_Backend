# == Schema Information
#
# Table name: progresos
#
#  id                    :integer          not null, primary key
#  repeticion_completada :integer          default(0), not null
#  estudiante_id         :integer          not null
#  leccion_id            :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Progreso < ApplicationRecord

  #Relaciones
  belongs_to :leccion
  belongs_to :estudiante

  #Validaciones
  validates :repeticion_completada, numericality: { greater_than_or_equal_to: 0 }

end
