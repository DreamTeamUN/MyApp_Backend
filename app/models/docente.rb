# == Schema Information
#
# Table name: docentes
#
#  id         :integer          not null, primary key
#  usuario_id :integer          not null
#

class Docente < ApplicationRecord

  #Relaciones
  has_many :docente_programa
  has_many :programa, through: :docente_programa, dependent: :destroy
  has_many :aula
  belongs_to :usuario

  #Validaciones
  validates :usuario_id, uniqueness: true

  #Consultas
  def self.total( page )
    all.paginate(page: page, per_page: 10)
  end

end
