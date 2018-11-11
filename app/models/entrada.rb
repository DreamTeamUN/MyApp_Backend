# == Schema Information
#
# Table name: entradas
#
#  id              :integer          not null, primary key
#  publicado       :boolean          default(FALSE), not null
#  abierto         :boolean          default(FALSE), not null
#  ramificacion    :integer          default(0), not null
#  entrada_id      :integer
#  nivel_acceso_id :integer          not null
#  usuario_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  titulo          :string
#  resumen         :string           default("")
#  texto           :string           default("")
#  oculta          :boolean          default(FALSE)
#

class Entrada < ApplicationRecord

  #Relaciones
  belongs_to :entrada
  belongs_to :nivel_acceso
  belongs_to :usuario

  #Validaciones
  validates :ramificacion, inclusion: { in: [1, 2, 3], message: "%{value} no es un valor de ramificacion valido"}
  validates :titulo, presence: true, length: { maximum: 20, minimum: 5}
  validates :resumen, length: { maximum: 40 }

  #Consultas
  def self.by_usuario( usuario_id, page )
    where("usuario_id == ?", usuario_id).paginate(page: page, per_page: 10)
  end

  def self.by_nivel_acceso( nivel_acceso_id, page )
    where("nivel_acceso_id == ?", nivel_acceso_id).paginate(page: page, per_page: 10)
  end

  def self.by_entrada( entrada_id, page )
    where("entrada_id == ?", entrada_id).paginate(page: page, per_page: 10)
  end

end
