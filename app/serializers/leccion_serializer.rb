# == Schema Information
#
# Table name: leccions
#
#  id          :integer          not null, primary key
#  semana      :integer          default(1), not null
#  programa_id :integer          not null
#

class LeccionSerializer < ActiveModel::Serializer
  attributes :id, :semana, :programa

  has_many :frase
end
