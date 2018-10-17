# == Schema Information
#
# Table name: tipo_actividads
#
#  id          :integer          not null, primary key
#  nombre      :string           not null
#  descripcion :string
#

class TipoActividadSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion

  has_many :registro_actividad
end
