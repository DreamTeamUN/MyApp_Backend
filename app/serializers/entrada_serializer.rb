class EntradaSerializer < ActiveModel::Serializer
  attributes :id, :publicado, :abierto, :ramificacion, :archivo_id, :entrada_id, :nivel_acceso_id. :usuario_id, :created_at
end
