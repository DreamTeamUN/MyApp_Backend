class Entrada < ApplicationRecord

  #Relaciones
  belongs_to :entrada
  belongs_to :archivo
  belongs_to :nivel_acceso
  belongs_to :usuario

  #Validaciones
  
end
