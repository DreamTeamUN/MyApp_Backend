class TipoUsuarioSerializer < ActiveModel::Serializer
  attributes :id, :nombre

  has_many :usuario
  has_many :frase_pnl
end
