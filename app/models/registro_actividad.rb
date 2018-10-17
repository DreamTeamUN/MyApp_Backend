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

class RegistroActividad < ApplicationRecord

  #Relaciones
  belongs_to :usuario
  belongs_to :tipo_actividad

  #Validaciones

end
