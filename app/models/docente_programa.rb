# == Schema Information
#
# Table name: docente_programas
#
#  id          :integer          not null, primary key
#  docente_id  :integer          not null
#  programa_id :integer          not null
#

class DocentePrograma < ApplicationRecord

  #Relaciones
  belongs_to :programa
  belongs_to :docente
  has_many :aula

  #Validaciones
  
end
