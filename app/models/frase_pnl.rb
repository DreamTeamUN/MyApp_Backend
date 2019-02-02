# == Schema Information
#
# Table name: frase_pnls
#
#  id              :integer          not null, primary key
#  frase           :string           not null
#  tipo_usuario_id :integer
#

class FrasePnl < ApplicationRecord

  #Relaciones
  belongs_to :tipo_usuario

  #Validaciones
  validates :frase, length: { minimum: 3, maximum: 45 }
  validates :tipo_usuario_id, presence: true

  #Consultas

  def self.by_tipo_usuario( tipo_usuario_id )
    where("tipo_usuario_id == ? OR tipo_usuario_id == 0", tipo_usuario_id)
  end

end
