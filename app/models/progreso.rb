class Progreso < ApplicationRecord

  #Relaciones
  belongs_to :leccion
  belongs_to :estudiante

  #Validaciones
  validates :repeticion_completada, numericality: { :greater_than_or_equal_to: 0 }

end
