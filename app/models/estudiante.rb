# == Schema Information
#
# Table name: estudiantes
#
#  id         :integer          not null, primary key
#  usuario_id :integer          not null
#  tutor_id   :integer          not null
#

class Estudiante < ApplicationRecord

  #Relaciones
  has_and_belongs_to_many :aula
  has_many :progreso
  belongs_to :tutor
  belongs_to :usuario
  has_many :puntuacion

  #Validaciones
  
end
