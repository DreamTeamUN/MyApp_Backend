class DocentePrograma < ApplicationRecord

  #Relaciones
  belongs_to :programa
  belongs_to :docente
  has_many :aula

  #Validaciones
  
end
