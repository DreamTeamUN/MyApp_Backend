class EstudianteSerializer < ActiveModel::Serializer
  attributes :id, :usuario_id, :tutor_id

  has_many :progreso
  has_many :puntuacion
end
