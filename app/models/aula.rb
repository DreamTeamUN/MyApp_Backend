class Aula < ApplicationRecord

  #Relaciones
  has_and_belongs_to_many :estudiante
  belongs_to :docente_programa

  #Validaciones

end
