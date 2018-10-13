class Entrada < ApplicationRecord

  #Relaciones
  belongs_to :entrada
  belongs_to :archivo
  belongs_to :nivel_acceso
  belongs_to :usuario

  #Validaciones
  validates :ramificacion, inclusion: { in: [0, 1, 2, 3], message: "%{value} no es un valor de ramificacion valido"}
end
