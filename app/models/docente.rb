class Docente < ApplicationRecord

  #Relaciones
  has_and_belongs_to_many :programa
  belongs_to :usuario

  #Validaciones

end
