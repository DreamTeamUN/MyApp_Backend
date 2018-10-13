# == Schema Information
#
# Table name: estudiante_aulas
#
#  id            :integer          not null, primary key
#  aula_id       :integer          not null
#  estudiante_id :integer          not null
#

class EstudianteAula < ApplicationRecord

  #Relaciones
  belongs_to :aula
  belongs_to :estudiante

  #Validaciones

end
