# == Schema Information
#
# Table name: leccions
#
#  id          :integer          not null, primary key
#  semana      :integer          default(1), not null
#  programa_id :integer          not null
#

class Leccion < ApplicationRecord

  #Relaciones
  has_many :frase
  has_many :puntuacion
  has_many :progreso
  belongs_to :programa

  #Validaciones
  validates :semana, numericality: { greater_than: 0 }

  #Consultas
  def self.by_programa( programa_id )
    where("programa_id == ?", programa_id)
  end

  def self.repetido( programa_id, semana)
    where("programa_id == ? AND semana == ?", programa_id, semana)
  end

end
