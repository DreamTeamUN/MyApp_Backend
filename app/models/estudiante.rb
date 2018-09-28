class Estudiante < ApplicationRecord
  has_and_belongs_to_many :aula
  has_many :progreso
  belongs_to :tutor
  belongs_to :usuario
  has_many :puntuacion
end
