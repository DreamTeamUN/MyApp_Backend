class FraseSerializer < ActiveModel::Serializer
  attributes :id, :frase, :leccion_id

  has_many :archivo_juego
end
