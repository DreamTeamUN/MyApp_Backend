# == Schema Information
#
# Table name: estudiante_aulas
#
#  id            :integer          not null, primary key
#  aula_id       :integer          not null
#  estudiante_id :integer          not null
#

class EstudianteAulaSerializer < ActiveModel::Serializer
  attributes :id, :aula_id, :estudiante_id
end
