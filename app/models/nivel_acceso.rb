# == Schema Information
#
# Table name: nivel_accesos
#
#  id     :integer          not null, primary key
#  nombre :string           not null
#

class NivelAcceso < ApplicationRecord

  #Relaciones
  has_many :entrada

  #Validaciones
  validates :nombre, length: { minimum: 2, maximum: 45 }

end
