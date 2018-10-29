# == Schema Information
#
# Table name: tutors
#
#  id         :integer          not null, primary key
#  usuario_id :integer          not null
#

class Tutor < ApplicationRecord

  #Relaciones
  belongs_to :usuario
  has_many :estudiante

  #Validaciones
  validates :usuario_id, uniqueness: true

end
