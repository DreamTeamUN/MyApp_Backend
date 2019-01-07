# == Schema Information
#
# Table name: aulas
#
#  id          :integer          not null, primary key
#  docente_id  :integer
#  programa_id :integer
#  nombre      :string
#  descripcion :string           default("")
#

class AulaSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion, :docente_id, :programa

  has_many :estudiante

end
