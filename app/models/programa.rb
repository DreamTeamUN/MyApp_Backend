class Programa < ApplicationRecord

  #Relaciones
  has_and_belongs_to_many :docente
  has_many :leccion

  #Validaciones
  validates :nombre, length: { minimum: 2, maximum: 45 }

end
