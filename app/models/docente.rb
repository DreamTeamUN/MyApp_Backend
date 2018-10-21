# == Schema Information
#
# Table name: docentes
#
#  id         :integer          not null, primary key
#  usuario_id :integer          not null
#

class Docente < ApplicationRecord

  #Relaciones
  has_and_belongs_to_many :programa
  belongs_to :usuario

  #Validaciones
  validates :usuario_id, uniqueness: true

end
