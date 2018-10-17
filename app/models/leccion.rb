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

end
