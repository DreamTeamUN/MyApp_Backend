class TipoUsuario < ApplicationRecord

  #Relaciones
  has_many :usuario
  has_many :frase_pnl

  #Validaciones
  validates :nombre, length: { minimum: 3, maximum: 45 }

end
