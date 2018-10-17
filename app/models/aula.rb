# == Schema Information
#
# Table name: aulas
#
#  id                  :integer          not null, primary key
#  docente_programa_id :integer          not null
#

class Aula < ApplicationRecord

  #Relaciones
  has_and_belongs_to_many :estudiante
  belongs_to :docente_programa

  #Validaciones

end
