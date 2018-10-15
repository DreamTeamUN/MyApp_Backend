class ArchivoJuegoSerializer < ActiveModel::Serializer
  attributes :id, :tipo_juego_id, :archivo_id, :frase_id
end
