# == Schema Information
#
# Table name: aulas
#
#  id                  :integer          not null, primary key
#  docente_programa_id :integer          not null
#

class AulaSerializer < ActiveModel::Serializer
  attributes :id, :docente_programa_id
  
end
