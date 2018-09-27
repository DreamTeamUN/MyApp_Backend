class Leccion < ApplicationRecord
  has_many :frase
  has_many :puntuacion
  has_many :progreso
  belongs_to :programa
end
