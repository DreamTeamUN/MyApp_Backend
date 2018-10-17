# == Schema Information
#
# Table name: docentes
#
#  id         :integer          not null, primary key
#  usuario_id :integer          not null
#

class DocenteSerializer < ActiveModel::Serializer
  attributes :id, :usuario_id
end
