# == Schema Information
#
# Table name: leccions
#
#  id          :integer          not null, primary key
#  semana      :integer          default(1), not null
#  programa_id :integer          not null
#

class LeccionSerializer < ActiveModel::Serializer
  attributes :id, :semana, :programa_id

  has_many :frase
  has_many :puntuacion
  has_many :progreso
end
