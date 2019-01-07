# == Schema Information
#
# Table name: aulas
#
#  id          :integer          not null, primary key
#  docente_id  :integer
#  programa_id :integer
#  nombre      :string
#  descripcion :string           default("")
#

class Aula < ApplicationRecord

  #Relaciones
  has_many :estudiante_aula
  has_many :estudiante, through: :estudiante_aula
  belongs_to :docente
  belongs_to :programa

  #Validaciones

  validates :nombre, presence: true, length: { maximum: 20, minimum: 3}

  #Consultas
  def self.by_programa( programa_id, page )
    where("programa_id == ?", programa_id).paginate(page: page, per_page: 10)
  end

  def self.by_docente( docente_id, page )
    where("docente_id == ?", docente_id).paginate(page: page, per_page: 10)
  end

end
