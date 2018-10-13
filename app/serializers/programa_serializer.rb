class ProgramaSerializer < ActiveModel::Serializer
  attributes :id, :nombre

  has_many :leccion
end
