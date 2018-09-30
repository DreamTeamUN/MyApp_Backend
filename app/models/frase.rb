class Frase < ApplicationRecord

  #Relaciones
  belongs_to :leccion
  has_many :archivo_juego

  #Validaciones
  validates :frase, length: { minimum: 3, maximum: 45 }

end
