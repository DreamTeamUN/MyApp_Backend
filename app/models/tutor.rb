class Tutor < ApplicationRecord

  #Relaciones
  belongs_to :usuario
  has_many :estudiante

  #Validaciones
  
end
