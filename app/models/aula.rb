# == Schema Information
#
# Table name: aulas
#
#  id                  :integer          not null, primary key
#  docente_programa_id :integer          not null
#

class Aula < ApplicationRecord

  #Relaciones
  has_many :estudiante, through: :estudiante_aula
  belongs_to :docente_programa

  #Validaciones

end
