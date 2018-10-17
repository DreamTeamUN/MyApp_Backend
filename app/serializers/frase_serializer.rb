# == Schema Information
#
# Table name: frases
#
#  id         :integer          not null, primary key
#  frase      :string           not null
#  leccion_id :integer          not null
#

class FraseSerializer < ActiveModel::Serializer
  attributes :id, :frase, :leccion_id

  has_many :archivo_juego
end
