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
end
