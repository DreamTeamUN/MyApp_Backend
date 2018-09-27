class Estudiante < ApplicationRecord
  has_many :estudiante_aula
  has_many :progreso
  belongs_to :tutor
  belongs_to :usuario
  has_many :puntuacion
end
