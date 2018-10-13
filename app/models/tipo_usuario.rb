# == Schema Information
#
# Table name: tipo_usuarios
#
#  id     :integer          not null, primary key
#  nombre :string           not null
#

class TipoUsuario < ApplicationRecord

  #Relaciones
  has_many :usuario
  has_many :frase_pnl

  #Validaciones
  validates :nombre, length: { minimum: 3, maximum: 45 }

end
