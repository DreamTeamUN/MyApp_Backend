class Entrada < ApplicationRecord

  #Relaciones
  belongs_to :entrada
  belongs_to :archivo
  belongs_to :nivel_acceso
  belongs_to :usuario

  #Validaciones
  validates :ramificacion, numericality: { greater_than_or_equal_to: 0 }
  validates :ramificacion, numericality: { smaller_than_or_equal_to: 3 }
end
