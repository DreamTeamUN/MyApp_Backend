# == Schema Information
#
# Table name: docente_programas
#
#  id          :integer          not null, primary key
#  docente_id  :integer          not null
#  programa_id :integer          not null
#

class DocenteProgramaSerializer < ActiveModel::Serializer
  attributes :id, :docente_id, :programa_id

end
