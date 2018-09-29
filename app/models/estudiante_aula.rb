class EstudianteAula < ApplicationRecord

  #Relaciones
  belongs_to :aula
  belongs_to :estudiante

  #Validaciones

end
