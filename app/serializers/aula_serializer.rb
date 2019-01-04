# == Schema Information
#
# Table name: aulas
#
#  id          :integer          not null, primary key
#  docente_id  :integer
#  programa_id :integer
#

class AulaSerializer < ActiveModel::Serializer
  attributes :id, :docente_id, :programa

  has_many :estudiante

end
