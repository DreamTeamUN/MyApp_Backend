class LeccionSerializer < ActiveModel::Serializer
  attributes :id, :semana, :programa_id

  has_many :frase
  has_many :puntuacion
  has_many :progreso
end
