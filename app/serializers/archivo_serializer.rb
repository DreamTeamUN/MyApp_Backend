# == Schema Information
#
# Table name: archivos
#
#  id           :integer          not null, primary key
#  nombre       :string           not null
#  tipo_archivo :string           default("archivo"), not null
#  extension    :string           not null
#  ruta         :string           not null
#

class ArchivoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :tipo_archivo, :extension, :ruta

  has_one :archivo_juego
  has_one :juego, through: :archivo_juego
  has_one :entradas
  has_many :usuario
  has_many :estudiante
end
