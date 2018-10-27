# == Schema Information
#
# Table name: estudiantes
#
#  id               :integer          not null, primary key
#  tutor_id         :integer          not null
#  nombre           :string
#  fecha_nacimiento :date
#  archivo_id       :integer          default(0)
#

class Estudiante < ApplicationRecord

  #Relaciones
  has_many :estudiante_aula
  has_many :aula, through: :estudiante_aula
  has_many :progreso
  belongs_to :tutor
  has_many :puntuacion
  belongs_to :archivo

  #Validaciones
  validates :nombre, length: { minimum: 3, maximum: 45 }, presence: true

end
