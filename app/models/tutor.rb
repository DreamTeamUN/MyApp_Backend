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

  #Consultas
  def self.total( page )
    all.paginate(page: page, per_page: 10)
  end

end
