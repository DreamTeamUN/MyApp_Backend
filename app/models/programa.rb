# == Schema Information
#
# Table name: programas
#
#  id     :integer          not null, primary key
#  nombre :string           not null
#

class Programa < ApplicationRecord

  #Relaciones
  has_many :docente, through: :docente_programa
  has_many :leccion

  #Validaciones
  validates :nombre, length: { minimum: 2, maximum: 45 }

end
