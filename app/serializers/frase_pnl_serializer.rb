# == Schema Information
#
# Table name: frase_pnls
#
#  id              :integer          not null, primary key
#  frase           :string           not null
#  tipo_usuario_id :integer
#

class FrasePnlSerializer < ActiveModel::Serializer
  attributes :id, :frase, :tipo_usuario
end
