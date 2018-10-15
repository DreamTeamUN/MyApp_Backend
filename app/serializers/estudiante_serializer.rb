# == Schema Information
#
# Table name: estudiantes
#
#  id         :integer          not null, primary key
#  usuario_id :integer          not null
#  tutor_id   :integer          not null
#

class EstudianteSerializer < ActiveModel::Serializer
  attributes :id, :usuario_id, :tutor_id

  has_many :progreso
  has_many :puntuacion
end
