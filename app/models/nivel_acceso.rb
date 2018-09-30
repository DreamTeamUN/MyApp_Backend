class NivelAcceso < ApplicationRecord

  #Relaciones
  has_many :entrada

  #Validaciones
  validates :nombre, length: { minimum: 2, maximum: 45 }

end
