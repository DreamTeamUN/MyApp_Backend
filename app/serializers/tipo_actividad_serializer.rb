class TipoActividadSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion

  has_many :registro_actividad
end
