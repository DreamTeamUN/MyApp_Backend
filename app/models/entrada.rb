# == Schema Information
#
# Table name: entradas
#
#  id              :integer          not null, primary key
#  publicado       :boolean          default(FALSE), not null
#  abierto         :boolean          default(FALSE), not null
#  ramificacion    :integer          default(0), not null
#  archivo_id      :integer          not null
#  entrada_id      :integer
#  nivel_acceso_id :integer          not null
#  usuario_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  titulo          :string
#  resumen         :string
#

class Entrada < ApplicationRecord

  #Relaciones
  belongs_to :entrada
  belongs_to :archivo
  belongs_to :nivel_acceso
  belongs_to :usuario

  #Validaciones
  validates :ramificacion, inclusion: { in: [0, 1, 2, 3], message: "%{value} no es un valor de ramificacion valido"}

  #Consultas
  def self.by_usuario( usuario_id, page ) #TODO: NO se de donde sacar el parametro page
    where("usuario_id == ?", usuario_id).paginate(page: page, per_page: 10)
  end

  def self.by_nivel_acceso( nivel_acceso_id, page )
    where("nivel_acceso_id == ?", nivel_acceso_id).paginate(page: page, per_page: 10)
  end

end
