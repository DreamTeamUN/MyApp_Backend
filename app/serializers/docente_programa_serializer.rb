class DocenteProgramaSerializer < ActiveModel::Serializer
  attributes :id, :docente_id, :programa_id

  has_many :aula
end
