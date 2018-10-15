class TutorSerializer < ActiveModel::Serializer
  attributes :id, :usuario_id

  has_many :estudiante
end
