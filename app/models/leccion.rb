class Leccion < ApplicationRecord

  #Relaciones
  has_many :frase
  has_many :puntuacion
  has_many :progreso
  belongs_to :programa

  #Validaciones
  validates :semana, numericality: { greater_than: 0 }

end
