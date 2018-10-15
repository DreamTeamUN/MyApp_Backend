class ArchivoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :tipo_archivo, :extension, :ruta

  has_one :archivo_juego
  has_one :juego, through: :archivo_juego
  has_one :entradas
  has_many :usuario
end
