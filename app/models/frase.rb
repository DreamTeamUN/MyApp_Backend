# == Schema Information
#
# Table name: frases
#
#  id         :integer          not null, primary key
#  frase      :string           not null
#  leccion_id :integer          not null
#

class Frase < ApplicationRecord

  #Relaciones
  belongs_to :leccion
  has_many :archivo_juego

  #Validaciones
  validates :frase, length: { minimum: 3, maximum: 45 }

  #Consultas

  def self.by_leccion( leccion_id )
    where("leccion_id == ?", leccion_id)
  end

end
