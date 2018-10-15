# == Schema Information
#
# Table name: programas
#
#  id     :integer          not null, primary key
#  nombre :string           not null
#

class ProgramaSerializer < ActiveModel::Serializer
  attributes :id, :nombre

  has_many :leccion
end
