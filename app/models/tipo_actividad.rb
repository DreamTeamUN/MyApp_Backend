# == Schema Information
#
# Table name: tipo_actividads
#
#  id          :integer          not null, primary key
#  nombre      :string           not null
#  descripcion :string
#

class TipoActividad < ApplicationRecord

  #Relaciones
  has_many :registro_actividad

  #Validaciones
  validates :nombre, length: { minimum: 3, maximum: 45 }
  validates :descripcion, length: { maximum: 100 }

end
