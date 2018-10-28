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

class EstudianteSerializer < ActiveModel::Serializer
  attributes :id, :tutor_id, :nombre, :fecha_nacimiento, :archivo_id

  has_many :progreso
  has_many :puntuacion
end
