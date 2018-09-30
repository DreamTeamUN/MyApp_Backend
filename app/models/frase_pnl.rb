class FrasePnl < ApplicationRecord

  #Relaciones
  belongs_to :tipo_usuario

  #Validaciones
  validates :frase, length: { minimum: 3, maximum: 45 }

end
