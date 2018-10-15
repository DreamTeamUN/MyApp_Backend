class PuntuacionSerializer < ActiveModel::Serializer
  attributes :id, :puntuacion_obtenida, :tipo_juego_id, :estudiante_id, :leccion_id
end
