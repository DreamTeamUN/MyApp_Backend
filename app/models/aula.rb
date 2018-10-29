# == Schema Information
#
# Table name: aulas
#
#  id          :integer          not null, primary key
#  docente_id  :integer
#  programa_id :integer
#

class Aula < ApplicationRecord

  #Relaciones
  has_many :estudiante_aula
  has_many :estudiante, through: :estudiante_aula
  belongs_to :docente
  belongs_to :programa

  #Validaciones

end
