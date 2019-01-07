# == Schema Information
#
# Table name: archivo_juegos
#
#  id            :integer          not null, primary key
#  tipo_juego_id :integer          not null
#  archivo_id    :integer          not null
#  frase_id      :integer
#

class ArchivoJuegoSerializer < ActiveModel::Serializer
  attributes :id, :tipo_juego, :archivo, :frase
end
