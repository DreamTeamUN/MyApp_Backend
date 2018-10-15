class NivelAccesoSerializer < ActiveModel::Serializer
  attributes :id, :nombre


  has_many :entrada
end
