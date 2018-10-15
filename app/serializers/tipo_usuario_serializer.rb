# == Schema Information
#
# Table name: tipo_usuarios
#
#  id     :integer          not null, primary key
#  nombre :string           not null
#

class TipoUsuarioSerializer < ActiveModel::Serializer
  attributes :id, :nombre

  has_many :usuario
  has_many :frase_pnl
end
