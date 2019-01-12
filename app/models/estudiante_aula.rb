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

  #Consultas
  def self.by_aula( aula_id, page )
    where("aula_id == ?", aula_id).paginate(page: page, per_page: 10)
  end

  def self.by_estudiante( estudiante_id, page )
    where("estudiante_id == ?", estudiante_id).paginate(page: page, per_page: 10)
  end

  def self.repetido( estudiante_id, aula_id)
    where("estudiante_id == ? AND aula_id == ?", estudiante_id, aula_id)
  end

end
