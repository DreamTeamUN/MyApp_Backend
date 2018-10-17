# == Schema Information
#
# Table name: registro_actividads
#
#  id                :integer          not null, primary key
#  usuario_id        :integer          not null
#  tipo_actividad_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class RegistroActividadSerializer < ActiveModel::Serializer
  attributes :id, :usuario_id, :tipo_actividad_id
end
