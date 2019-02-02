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

  #Validaciones

  #Consultas
  def self.by_programa( programa_id, page )
    where("programa_id == ?", programa_id).paginate(page: page, per_page: 10)
  end

  def self.by_docente( docente_id, page )
    where("docente_id == ?", docente_id).paginate(page: page, per_page: 10)
  end

  def self.repetido( docente_id, programa_id)
    where("docente_id == ? AND programa_id == ?", docente_id, programa_id)
  end

end
