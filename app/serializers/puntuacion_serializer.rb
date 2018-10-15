# == Schema Information
#
# Table name: puntuacions
#
#  id                  :integer          not null, primary key
#  puntuacion_obtenida :integer          default(0), not null
#  tipo_juego_id       :integer          not null
#  estudiante_id       :integer          not null
#  leccion_id          :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PuntuacionSerializer < ActiveModel::Serializer
  attributes :id, :puntuacion_obtenida, :tipo_juego_id, :estudiante_id, :leccion_id
end
