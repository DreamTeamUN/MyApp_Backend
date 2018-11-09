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

class EntradaSerializer < ActiveModel::Serializer
  attributes :id, :publicado, :abierto, :ramificacion, :titulo, :resumen, :texto, :entrada_id, :nivel_acceso_id, :usuario_id, :created_at
end
