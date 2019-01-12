# == Schema Information
#
# Table name: nivel_accesos
#
#  id     :integer          not null, primary key
#  nombre :string           not null
#

class NivelAccesoSerializer < ActiveModel::Serializer
  attributes :id, :nombre
end
