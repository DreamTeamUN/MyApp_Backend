# == Schema Information
#
# Table name: tipo_juegos
#
#  id          :integer          not null, primary key
#  nombre      :string           not null
#  descripcion :text
#

class TipoJuegoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion

  has_many :archivo_juego
  has_many :archivo, through: :archivo_juego
  has_many :puntuacion
end
